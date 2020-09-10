import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_clean/core/data/datasources/data_dummy.dart';
import 'package:test_app_clean/core/domain/entities/user.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthInitial());

  void tryLogin(String phone, String password) {
    bool found = false;
    print(phone);
    AuthState state;
    userDummyList.forEach((item) {
      print(item.phone);
      if (phone == item.phone) {
        found = true;
        if (item.password == item.password) {
          state = SuccessLoginState(item);
        }
        else {
          state = FailedState("Wrong password", "");
        }
      }
    });
    if (!found) {
      state = FailedState("UserEntity not found", "");
    }
    emit(state);
  }

  void tryLoginEmail(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _name = prefs.getString('user_name') ?? "";
    final _email = prefs.getString('user_email') ?? "";
    final _address = prefs.getString('user_address') ?? "";
    final _birthdate = prefs.getString('user_birthdate') ?? "";
    final _password = prefs.getString('user_password') ?? "";
    AuthState state;

    print('$email $_email');
    print('$password $_password');

    if (email == _email) {
      print('email');
      if (password == _password) {
        print('password');
        prefs.setString('login_name', _name);
        prefs.setString('login_email', _email);
        prefs.setString('login_address', _address);
        prefs.setString('login_birthdate', _birthdate);
        prefs.setString('login_password', _password);
        prefs.setBool('is_logged_in', true);

        UserEntity user = UserEntity(name: _name, email: _email, address: _address, password: _password);

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
    final emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    print("Registering");

    if (name.length > 5) {
      if (emailValidator.hasMatch(email)) {
        if (address.isNotEmpty) {
          if (birthdate.isNotEmpty) {
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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged_in', false);
    emit(state);
  }

  void isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('is_logged_in');
    AuthState state = AuthInitial();

    if (isLoggedIn) {
      final name = prefs.getString('user_name');
      UserEntity user = UserEntity(name: name,);
      state = SuccessLoginState(user);
    }

    emit(state);
  }

  void login() {
    emit(SuccessLoginState(UserEntity()));
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', '');
    prefs.setString('user_email', '');
    prefs.setString('user_address', '');
    prefs.setString('user_birthdate', '');
    prefs.setString('user_password', '');
    prefs.setBool('is_logged_in', false);

    emit(AuthInitial());
  }
}
