// import 'package:balangoda_pulse/src/constants/Image_strings.dart';
// import 'package:balangoda_pulse/src/constants/colors.dart';
// import 'package:balangoda_pulse/src/constants/sizes.dart';
// import 'package:balangoda_pulse/src/constants/text_strings.dart';
// import 'package:balangoda_pulse/src/features/authentication/models/user_model.dart';
// import 'package:balangoda_pulse/src/features/core/controllers/profile_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//
// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//
//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
//           title: Text(editProfile, style: Theme.of(context).textTheme.bodyLarge)
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//             padding: const EdgeInsets.all(defaultSize),
//             child: FutureBuilder(
//               future: controller.getUserData(),
//               builder: (context, snapshot) {
//                 if(snapshot.connectionState == ConnectionState.done) {
//                   if(snapshot.hasData) {
//                     UserModel? user = snapshot.data as UserModel;
//                     if(user != null) {
//                       final fullName = TextEditingController(text: user.username);
//                       final email = TextEditingController(text: user.email);
//                       final phoneNumber = TextEditingController(text: user.phoneNumber);
//                       final password = TextEditingController(text: user.password);
//
//                       return Column(
//                           children: [
//                             Stack(
//                                 children: [
//                                   SizedBox(
//                                       width: 120,
//                                       height: 120,
//                                       child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(100),
//                                           child: const Image(image: AssetImage(profileImage))
//                                       )
//                                   ),
//                                   Positioned(
//                                     bottom: 0,
//                                     right: 0,
//                                     child: Container(
//                                         width: 35,
//                                         height: 35,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(100),
//                                             color: primaryColor
//                                         ),
//                                         child: const Icon(
//                                             LineAwesomeIcons.camera,
//                                             size: 20.0,
//                                             color: Colors.black
//                                         )
//                                     ),
//                                   )
//                                 ]
//                             ),
//                             const SizedBox(height: 50),
//
//
//                             Form(
//                                 child: Column(
//                                     children: [
//                                       TextFormField(
//                                           controller: fullName,
//                                           decoration: const InputDecoration(
//                                               label: Text("Full Name"),
//                                               prefixIcon: Icon(Icons.person_outline_outlined)
//                                           )
//                                       ),
//                                       const SizedBox(height: formHeight - 20),
//                                       TextFormField(
//                                           controller: email,
//                                           decoration: const InputDecoration(
//                                               label: Text("E-Mail"),
//                                               prefixIcon: Icon(Icons.email_outlined)
//                                           )
//                                       ),
//                                       const SizedBox(height: formHeight - 20),
//                                       TextFormField(
//                                           controller: phoneNumber,
//                                           decoration: const InputDecoration(
//                                               label: Text("Phone Number"),
//                                               prefixIcon: Icon(Icons.phone_iphone_outlined)
//                                           )
//                                       ),
//                                       const SizedBox(height: formHeight - 20),
//                                       TextFormField(
//                                           controller: password,
//                                           decoration: const InputDecoration(
//                                               label: Text("Password"),
//                                               prefixIcon: Icon(Icons.fingerprint_outlined),
//                                               suffixIcon: IconButton(
//                                                 onPressed: null,
//                                                 icon: Icon(Icons.remove_red_eye_sharp),
//                                                 //    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
//                                                 // icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash: Iconsax.eye)
//                                               )
//                                           )
//                                       ),
//                                       const SizedBox(height: formHeight),
//                                       SizedBox(
//                                           width: double.infinity,
//                                           child: ElevatedButton(
//                                               onPressed: () async {
//                                                 final updatedUser = UserModel(
//                                                     username: fullName.text.trim(),
//                                                     email: email.text.trim(),
//                                                     phoneNumber: phoneNumber.text.trim(),
//                                                     password: password.text.trim()
//                                                 );
//                                                 await controller.updateRecord(updatedUser);
//
//                                               },
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor: primaryColor,
//                                                   side: BorderSide.none,
//                                                   shape: const StadiumBorder()
//                                               ),
//                                               child: const Text(
//                                                   editProfile,
//                                                   style: TextStyle(color: darkColor)
//                                               )
//                                           )
//                                       ),
//                                       const SizedBox(height: formHeight),
//                                       Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             const Text.rich(
//                                                 TextSpan(
//                                                     text: joined,
//                                                     style: TextStyle(fontSize: 12),
//                                                     children: [
//                                                       TextSpan(
//                                                           text: joinedAt,
//                                                           style: TextStyle(
//                                                               fontWeight: FontWeight.bold,
//                                                               fontSize: 12
//                                                           )
//                                                       )
//                                                     ]
//                                                 )
//                                             ),
//                                             ElevatedButton(
//                                                 onPressed: () {},
//                                                 style: ElevatedButton.styleFrom(
//                                                     backgroundColor: Colors.redAccent.withOpacity(0.1),
//                                                     elevation: 0,
//                                                     foregroundColor: Colors.red,
//                                                     shape: const StadiumBorder(),
//                                                     side: BorderSide.none
//                                                 ),
//                                                 child: const Text(delete)
//                                             )
//                                           ]
//                                       )
//                                     ]
//                                 )
//                             )
//
//
//                           ]
//                       );
//                     } else {
//                       return const Center(
//                           child: Text('Cannot find any fetching data!')
//                       );
//                     }
//                   } else if(snapshot.hasError) {
//                     return Center(
//                       child: Text(snapshot.error.toString())
//                     );
//                   } else {
//                     return const Center(
//                       child: Text('Something went wrong!')
//                     );
//                   }
//
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator()
//                   );
//                 }
//               }
//             )
//         ),
//       )
//     );
//   }
// }
