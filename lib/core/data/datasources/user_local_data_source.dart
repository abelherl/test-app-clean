import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_clean/core/data/models/user_model.dart';

class UserLocalDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
//  Future<UserModel> getLoggedInUser();
//  Future<void> logout();
//  Future<void> login(UserModel user);

  static const LOGGED_IN_USER = 'LOGGED_IN_USER';
  static const REGISTERED_USER = 'REGISTERED_USER';
  final SharedPreferences sharedPreferences;

  UserLocalDataSource(this.sharedPreferences);

  Future<UserModel> getLoggedInUser() {
    final jsonString = sharedPreferences.getString(LOGGED_IN_USER);
    if (jsonString != null && jsonString != '') {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    }
    else {
      return Future.value(UserModel(name: '', email: '', address: '', birthdate: '', password: '',));
    }
  }

  Future<UserModel> getRegisteredUser() {
    final jsonString = sharedPreferences.getString(REGISTERED_USER);
    if (jsonString != null && jsonString != '') {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    }
    else {
      return Future.value(UserModel(name: '', email: '', address: '', birthdate: '', password: '',));
    }
  }

  Future<bool> isLoggedIn() {
    bool loggedIn = false;
    if (sharedPreferences.getString(LOGGED_IN_USER) != '') {
      loggedIn = true;
    }
    return Future.value(loggedIn);
  }

  Future<void> register(UserModel user) {
    return sharedPreferences.setString(
      REGISTERED_USER,
      json.encode(user.toJson()),
    );
  }

  Future<void> login(UserModel user) {
    return sharedPreferences.setString(
      LOGGED_IN_USER,
      json.encode(user.toJson()),
    );
  }

  Future<void> logout() {
    return sharedPreferences.setString(
      LOGGED_IN_USER,
      '',
    );
  }
}

//class UserLocalDataSourceImpl implements UserLocalDataSource {
//  UserLocalDataSourceImpl({@required this.sharedPreferences});
//
//
//}
