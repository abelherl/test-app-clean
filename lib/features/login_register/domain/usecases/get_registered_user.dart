import 'package:equatable/equatable.dart';
import 'package:test_app_clean/core/domain/entities/user.dart';
import 'package:test_app_clean/core/domain/usecases/usecase.dart';
import 'package:test_app_clean/features/login_register/domain/repositories/user_repository.dart';

class GetRegisteredUser implements UseCase<User, Params> {
  final UserRepository repository;

  GetRegisteredUser(this.repository);

  @override
  Future<User> call(Params params) async {
    return await repository.getRegisteredUser();
  }
}

class Params extends Equatable {
  @override
  List<Object> get props => [];
}
