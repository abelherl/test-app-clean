import 'package:equatable/equatable.dart';
import 'package:test_app_clean/core/domain/entities/user.dart';
import 'package:test_app_clean/core/domain/usecases/usecase.dart';
import 'package:test_app_clean/features/login_register/domain/repositories/user_repository.dart';

class GetLoggedInUser implements UseCase<User, Params> {
  final UserRepository repository;

  GetLoggedInUser(this.repository);

  @override
  Future<User> call(Params params) async {
    return await repository.getLoggedInUser();
  }
}

class Params extends Equatable {
  @override
  List<Object> get props => [];
}
