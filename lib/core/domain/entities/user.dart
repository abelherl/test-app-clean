import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String password;

  UserEntity({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.password,
  });

  @override
  List<Object> get props =>[email];
}