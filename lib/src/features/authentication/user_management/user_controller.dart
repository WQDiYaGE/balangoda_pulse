import 'package:balangoda_pulse/src/features/authentication/user_management/user_state.dart';
import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController {
  var userState = UserState.Unauthenticated.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        userState.value = UserState.Unauthenticated;
        print("User is unauthenticated");
      } else {
        userState.value = UserState.Authenticated;
        print("User is authenticated");
        Get.offAll(() => const NavigationMenu());
      }
    });
  }

  void updateState(UserState state) {
    userState.value = state;
    print("User state updated to: $state");
  }


}
