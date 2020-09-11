import 'package:meta/meta.dart';
import 'package:test_app_clean/core/data/datasources/user_local_data_source.dart';
import 'package:test_app_clean/core/domain/entities/user.dart';
import 'package:test_app_clean/features/login_register/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<User> getLoggedInUser() async {
    return localDataSource.getLoggedInUser();
  }

  @override
  Future<User> getRegisteredUser() async {
    return localDataSource.getRegisteredUser();
  }

  @override
  Future<void> login(User user) {
    return localDataSource.login(user);
  }

  @override
  Future<bool> isLoggedIn() {
    return localDataSource.isLoggedIn();
  }

  @override
  Future<void> logout() {
    return localDataSource.logout();
  }

  @override
  Future<void> register(User user) {
    return localDataSource.register(user);
  }
}
