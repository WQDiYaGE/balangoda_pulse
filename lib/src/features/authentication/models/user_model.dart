

class UserModel {
  // String? _uid;
  final String? id;
  final String phoneNumber;
  final String password;
  final String email;
  final String username;

  const UserModel({
    // String? uid,
    this.id,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.username,
  });

  // String? get uid => _uid;
  // set uid(String? value) => _uid = value;

  toJson() {
    return {
      "phone_number": phoneNumber,
      "password": password,
      "email": email,
      "username": username
    };
  }

// factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//   final data = document.data()!;
//   return UserModel(
//       uid: document.id,
//       phoneNumber: data["phone_number"],
//       password: data["password"],
//       email: data["email"],
//       username: data["username"]
//   );
// }
}