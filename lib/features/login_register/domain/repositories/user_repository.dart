import 'package:test_app_clean/core/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getRegisteredUser();
  Future<User> getLoggedInUser();
  Future<void> register(User user);
  Future<void> login(User user);
  Future<void> logout();
  Future<bool> isLoggedIn();
}
