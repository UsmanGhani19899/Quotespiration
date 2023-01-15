class UserModel {
  String name;
  String email;
  String password;
  String uid;

  UserModel(
      {required this.email,
      required this.name,
      required this.password,
      required this.uid});

  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'] ?? "",
        name: map['name'] ?? "",
        password: map['password'] ?? "",
        uid: map['uid'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password, 'uid': uid};
  }
}
