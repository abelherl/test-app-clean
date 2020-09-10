import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_clean/features/login_register/presentation/bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  var isAllFilled = false;
  final _formKey = GlobalKey<FormState>();

  void validate() {
    if (isAllFilled) {
      final form = _formKey.currentState;
      if (form.validate()) {
        context.bloc<AuthBloc>().tryLoginEmail(_email.text, _password.text);
      } else {
        print('form invalid');
      }
    }
  }

  void checkIfAllFilled() {
    print("CALLED");
    if (_email.text.isNotEmpty && _email.text.isNotEmpty) {
      isAllFilled = true;
    }
    else {
      isAllFilled = false;
    }
  }

  @override
  void initState() {
    super.initState();
    context.bloc<AuthBloc>().login();
    final isLoggedIn = (context.bloc<AuthBloc>().state).isLoggedIn;
    print(isLoggedIn);
//    context.bloc<AuthBloc>().isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _email,
            onChanged: (_) => checkIfAllFilled(),
            style: TextStyle(color: Colors.black,),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Enter email",
              prefixIcon: Icon(Icons.alternate_email, color: Colors.grey[400]),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                  )
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -5, 0),
            height: 70,
            child: TextFormField(
              controller: _password,
              onChanged: (_) => checkIfAllFilled(),
              obscureText: true,
              style: TextStyle(color: Colors.black,),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Enter password",
                prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is FailedState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(state.errorMessage),
                    );
                  },
                );
              }
              if (state is SuccessLoginState) {
                print('success');
                Navigator.pushReplacementNamed(context, "/home");
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
//                if (state is SuccessState) {
//                  return Parent(
//                    style: ParentStyle()
//                      ..height(40)
//                      ..width(MediaQuery.of(context).size.width)
//                      ..background.color(Colors.grey[400])
//                      ..borderRadius(all: 5),
//                    child: FlatButton(
//                      child: Text(
//                        "LOGGED IN WITH USER NAMED ${state.user.name}",
//                        style: TextStyle(
//                          color: isAllFilled ? Colors.white : Colors.black87,
//                        ),
//                      ),
//                    ),
//                  );
//                }
                return Parent(
                  gesture: Gestures(),
                  style: ParentStyle()
                    ..height(40)
                    ..width(MediaQuery.of(context).size.width)
                    ..background.color(isAllFilled ? Colors.lightGreen[800] : Colors.grey[400])
                    ..borderRadius(all: 5)
                    ..ripple(isAllFilled ? true : false),
                  child: FlatButton(
                    onPressed: () {
                      validate();
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        color: isAllFilled ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}