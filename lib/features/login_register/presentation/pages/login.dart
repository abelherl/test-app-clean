import 'package:flutter/material.dart';
import 'package:test_app_clean/features/login_register/presentation/widget/login_form.dart';
import 'package:test_app_clean/features/login_register/presentation/widget/login_header.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black87,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              SizedBox(height: 40),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}


