import 'package:test_app_clean/core/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    String name,
    String email,
    String birthdate,
    String address,
    String password,
  }) : super(name: name, email: email, birthdate: birthdate, address: address, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['text'],
      email: (json['email']),
      birthdate: (json['birthdate']),
      address: (json['address']),
      password: (json['password']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'birthdate': birthdate,
      'address': address,
      'password': password,
    };
  }
}
