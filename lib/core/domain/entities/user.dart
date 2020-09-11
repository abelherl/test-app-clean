import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String birthdate;
  final String address;
  final String password;

  User({
    this.name,
    this.email,
    this.birthdate,
    this.address,
    this.password,
  });

  @override
  List<Object> get props =>[email];
}