import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:balangoda_pulse/src/exceptions/exceptions.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/email_verification_screen/email_verification_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


import '../../../main.dart';
import '../../features/authentication/screens/forget_password_screen/forget_password_otp_screen/otp_screen.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  late final Rx<User?> firebaseUser;

  var verificationId = ''.obs;

  Function? onEmailVerificationCompleted;

  // @override
  // void onReady() {
  //   firebaseUser = Rx<User?>(_auth.currentUser);
  //   firebaseUser.bindStream(_auth.userChanges());
  //   FlutterNativeSplash.remove();
  //   ever(firebaseUser, _setInitialScreen);
  //
  // }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());

    // React to the changes in the user's email verification status
    firebaseUser.listen((user) {
      if (user != null && user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      }
    });
  }

  void setEmailVerificationCallback() {
    onEmailVerificationCompleted = () {
      Get.offAll(() => const NavigationMenu());
    };
  }


  // -- Setting initial screen onLOAD
  _navigateToInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => const EmailVerificationScreen());
      }
    }
  }

  // -- Email & Password sign-in
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _navigateToInitialScreen(userCredential.user);
      return userCredential;
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      }
      throw ex;
    } catch(_){
      final ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      }
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential != null) {
        Get.offAll(() => const NavigationMenu());
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed: ${e.code}';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'There is no user corresponding to the given email.';
          break;
        case 'wrong-password':
          errorMessage = 'The password is invalid for the given email, or the account does not have a password set.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'The user corresponding to the given email has been disabled.';
      }

      print(errorMessage);
      Get.snackbar('Login Error', errorMessage);
      throw Exception(errorMessage); // Rethrow if needed
    } catch (e) {
      print('An unexpected error occurred: ${e.toString()}');
      Get.snackbar('Login Error', 'An unexpected error occurred.');
      rethrow; // Rethrow if necessary
    }
  }

  // Future<User?> loginUserWithPhoneNumber(String phoneNumber) async {
  //   try {
  //     // Assuming phoneNumber is unique and indexed in Firestore
  //     var users = FirebaseFirestore.instance.collection('Users');
  //     var querySnapshot = await users.where('phoneNumber', isEqualTo: phoneNumber).get();
  //
  //     if(querySnapshot.docs.isNotEmpty) {
  //       var userDoc = querySnapshot.docs.first.data();
  //       if(userDoc['isVerified'] == true) {
  //         // Assuming that the user is already authenticated and we're just fetching their data
  //         if (_auth.currentUser != null && _auth.currentUser!.uid == userDoc['uid']) {
  //           return _auth.currentUser; // User is already signed in
  //         } else {
  //           // Handle the case where the user needs to be signed in
  //           // You might need to sign in the user here if they aren't already
  //           String customToken = await getCustomTokenForUser(userDoc['uid']);
  //           await _auth.signInWithCustomToken();
  //           return _auth.currentUser;
  //         }
  //       }
  //     }
  //     return null; // Return null if no verified user is found
  //   } catch(e) {
  //     print('Failed to login user: ${e.toString()}');
  //     throw Exception('Failed to login with phone number');
  //   }
  // }



  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e) {
      final ex = Exceptions.fromCode(e.code);
      throw ex.message;
    } catch(_) {
      const ex = Exceptions();
      throw ex.message;
    }
  }


  // -- Federated identity & social sign-in
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('No Google account selected by user.');
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch(e) {
      // Log the error and also use it in the UI for more detailed feedback
      print("Firebase Auth Exception: ${e.message}");
      throw Exception('Firebase Auth Error: ${e.message}');
    } catch(e) {
      print("General Exception: $e");
      throw Exception('Failed to sign in with Google: $e');
    }
  }


  // Future<void> setUserAsVerified(String phoneNumber) async {
  //   try{
  //     var usersCollection = FirebaseFirestore.instance.collection('users');
  //     await usersCollection.doc(phoneNumber).set({
  //       'phoneNumber': phoneNumber,
  //       'isVerified': true
  //     }, SetOptions(merge: true));
  //     print("User verification status updated.");
  //   } catch(e) {
  //     print("Failed to set user as verified: $e");
  //   }
  //
  // }


  // Future<bool> checkUserVerification(String phoneNumber) async {
  //   var usersCollection = FirebaseFirestore.instance.collection('users');
  //   var doc = await usersCollection.doc(phoneNumber).get();
  //   return doc.exists && doc.data()?['isVerified'] == true;
  // }


  // Future<void> performLogin(String uid) async {
  //   try {
  //     String customToken = await _authService.getCustomToken(uid);
  //     await _authService.loginWithCustomToken(customToken);
  //   } catch(e) {
  //     print('Error during login: ${e.toString()}');
  //   }
  // }

  // Future<void> loginUserWithPhoneNumber(String phoneNumber) async {
  //   try {
  //     bool isVerified = await checkUserVerification(phoneNumber);
  //     if (isVerified) {
  //       String customToken = await _authService.getCustomToken(phoneNumber);
  //       await _authService.loginWithCustomToken(customToken);
  //     } else {
  //       // Proceed with phone verification if needed
  //       phoneAuthentication(phoneNumber);
  //     }
  //   } catch(e) {
  //     if (kDebugMode) {
  //       print('Error during login: ${e.toString()}');
  //     }
  //   }
  // }

  Future<bool> checkPhoneNumberExists(String phoneNumber) async {
    try {
      print("Now, it's time for fetching data!");
      var querySnapshot = await _db.collection('Users').where('phone_number', isEqualTo: phoneNumber).get();
      print("Data fetched successfully");
      return querySnapshot.docs.isNotEmpty;
    } catch(e) {
      print("Data cannot be fetched. Error: $e");
      Get.snackbar('Error', 'Failed to fetch user data. Check your internet connection.');
      return false;
    }
  }

  Future<bool> checkPassword(String phoneNumber, String password) async {
    try {
      var querySnapshot = await _db.collection('Users').where('phone_number', isEqualTo: phoneNumber).where('password', isEqualTo: password).get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error checking password: $e");
      return false;
    }
  }



  Future<void> phoneAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          final UserCredential userCredential = await _auth.signInWithCredential(credential);
          final user = userCredential.user;
          if(user != null) {
            Get.snackbar("Success", "Phone number automatically verified and user signed in!");
            // sendVerificationToServer(user.uid);

          } else {
            Get.snackbar("Verification Error", "No user returned from automatic sign in.");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          String? errorMessage = 'Something went wrong! Try again later.';
          if(e.code == 'quota-exceeded') {
            errorMessage = 'Too many verification requests. Please try again later!';
          }else if(e.code == 'invalid-phone-number') {
            errorMessage = 'The provided phone number is not valid!';
          } else {
            errorMessage = e.message; // Use the exception message directly for better context
          }
          print("Verification failed: ${e.message}");
          Get.snackbar('Error', errorMessage!);
        },
        codeSent: (verificationId, resendToken) async {
          this.verificationId.value = verificationId;
          // Optionally handle UI changes or navigate to the OTP Screen
          Get.to(() => const OTPScreen());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // The auto-retrieval has timed out; prompt the user to enter the code manually
          this.verificationId.value = verificationId; // Store the latest verification ID
          Get.snackbar("Timeout", "Auto-retrieval timeout, please enter the code manually.");

        }
    );
  }

  Future<void> sendVerificationToServer(String userId) async {
    var url = 'http://localhost:3000/verify-user';
    try {
      var response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'userId': userId
          })
      );

      if (response.statusCode == 200) {
        print('Custom claims set successfully.');
      } else {
        print('Failed to set custom claims: ${response.body}');
      }
    } catch(e) {
      print('Error sending verification to server: $e');
    }
  }


  // Ensure user is marked as verified after successful phone auth
  // if (!await checkUserVerification(phoneNumber)) {
  //   await setUserAsVerified(phoneNumber);
  // }


  Future<bool> verifyOTP(String otp) async {
    // try {
    //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationId,
    //     smsCode: otp
    //   );
    //
    //   // Try to sign in the user with the credential
    //   await _auth.signInWithCredential(credential);
    //   return true; // Return true if sign-in is successful
    // } catch (e) {
    //   print('Failed to sign in with OTP: ${e.toString()}');
    //   return false;
    // }

    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value,
            smsCode: otp
        )
    );
    return credentials.user != null?true:false;
  }

  Future<User?> loginUserWithPhoneNumber(String phoneNumber, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: phoneNumber, password: password); // You need to match the phone number with the corresponding email
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }


  // -- User log-out
  Future<void> logout() async => await _auth.signOut();



}
