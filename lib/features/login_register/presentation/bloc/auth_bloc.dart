import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_clean/core/data/datasources/user_local_data_source.dart';
import 'package:test_app_clean/core/data/models/user_model.dart';
import 'package:test_app_clean/core/domain/entities/user.dart';
import 'package:test_app_clean/features/login_register/data/repositories/user_repository_impl.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthInitial());

  void tryLoginEmail(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final localDataSource = UserLocalDataSource(prefs);
    final repository = UserRepositoryImpl(localDataSource: localDataSource);
    final user = await repository.getRegisteredUser();
    AuthState state;

    print('$email ${user.email}');
    print('$password ${user.password}');

    if (email == user.email) {
      print('email');
      if (password == user.password) {
        print('password');
        repository.login(user);
        state = SuccessLoginState(user);
      }
      else {
        state = FailedState('Wrong password', 'password');
      }
    }

    emit(state);
  }

  void tryRegister(String name, String email, String address, String birthdate, String password) async {
    AuthState state;
    final prefs = await SharedPreferences.getInstance();
    final localDataSource = UserLocalDataSource(prefs);
    final repository = UserRepositoryImpl(localDataSource: localDataSource);
    final emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    print("Registering");

    if (name.length > 5) {
      if (emailValidator.hasMatch(email)) {
        if (address.isNotEmpty) {
          if (birthdate.isNotEmpty) {
            UserModel user = UserModel(name: name, email: email, address: address, birthdate: birthdate, password: password);
            repository.register(user);
            state = SuccessRegisterState();
            print('success');
          }
        }
        else {
          state = FailedState("Please enter an address", "address");
        }
      }
      else {
        state = FailedState("Please enter a valid email", "email");
      }
    }
    else {
      state = FailedState("Please enter more than 5 characters", "name");
    }
    emit(state);
  }

  void isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final localDataSource = UserLocalDataSource(prefs);
    final repository = UserRepositoryImpl(localDataSource: localDataSource);
    final isLoggedIn = await repository.isLoggedIn();
    AuthState state = AuthInitial();

    if (isLoggedIn) {
      UserModel user = await repository.getLoggedInUser();
      repository.login(user);
      state = SuccessLoginState(user);
    }

    emit(state);
  }

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    final localDataSource = UserLocalDataSource(prefs);
    final repository = UserRepositoryImpl(localDataSource: localDataSource);
    final user = await repository.getLoggedInUser();
    AuthState state = AuthInitial();

    if (user.email != '') {
      state = SuccessLoginState(user);
    }

    emit(state);
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    final localDataSource = UserLocalDataSource(prefs);
    final repository = UserRepositoryImpl(localDataSource: localDataSource);
    await repository.logout();

    emit(AuthInitial());
  }
}


//        prefs.setString('login_name', _name);
//        prefs.setString('login_email', _email);
//        prefs.setString('login_address', _address);
//        prefs.setString('login_birthdate', _birthdate);
//        prefs.setString('login_password', _password);
//        prefs.setBool('is_logged_in', true);