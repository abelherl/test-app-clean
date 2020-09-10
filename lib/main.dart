import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_clean/features/home/presentation/pages/home.dart';
import 'package:test_app_clean/features/login_register/presentation/bloc/auth_bloc.dart';
import 'package:test_app_clean/features/login_register/presentation/pages/login.dart';
import 'package:test_app_clean/features/login_register/presentation/pages/register.dart';
import 'package:test_app_clean/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: mainTheme(),
    routes: {
      '/': (context) => BlocProvider(
        create: (context) => AuthBloc(),
        child: Register(),
      ),
      '/login': (context) => BlocProvider(
        create: (context) => AuthBloc(),
        child: Login(),
      ),
      '/home': (context) => BlocProvider(
        create: (context) => AuthBloc(),
        child: Home(),
      ),
    },
  ));
}