import 'dart:async';

import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_clean/features/login_register/presentation/bloc/auth_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name = '';
  var email = '';

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('login_name') ?? "";
      email = prefs.get('login_email') ?? "";
    });
  }

  bool isTapped = false;

  final cardStyle = ParentStyle()
    ..animate(200, Curves.decelerate)
    ..alignment.center()
    ..background.color(Colors.grey[200])
    ..padding(all: 15)
    ..width(double.infinity)
    ..maxHeight(70)
    ..borderRadius(all: 15)
    ..margin(all:15)
    ..ripple(true);

  final title = TxtStyle()
    ..fontSize(15)
    ..bold()
    ..textAlign.left();

  final subtitle = TxtStyle()
    ..fontSize(13)
    ..textColor(Colors.grey)
    ..textAlign.left();

  void logout() {
    context.bloc<AuthBloc>().logout();
    Timer(Duration(milliseconds: 500), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          color: Colors.blueGrey[50],
          height: 800,
          child: Column(
            children: <Widget>[
              Parent(
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Parent(
                          child: CircleAvatar(
//                            backgroundImage: AssetImage('assets/armie.gif'),
                          ),
                          style: ParentStyle()
                          ..height(100)
                          ..width(100)
                          ..background.color(Colors.white)
                          ..elevation(15)
                          ..borderRadius(all: 50)
                          ..ripple(true),
                        ),
                        SizedBox(height: 10,),
                        Txt(name, style: TxtStyle()
                          ..fontFamily('Poppins')
                          ..fontWeight(FontWeight.w900)
                          ..alignment.center()
                          ..textColor(Colors.white)
                          ..fontSize(30),),
                        SizedBox(height: 0,),
                        Txt(email, style: TxtStyle()
                          ..alignment.center()
                          ..textColor(Colors.white60)
                          ..fontSize(15),),
                      ],
                    ),
                ),
                style: ParentStyle()
                  ..background.color(Theme.of(context).primaryColor)
                  ..borderRadius(bottomLeft: 15, bottomRight: 15)
                  ..padding(horizontal: 30, top: 50, bottom: 40)
                  ..width(double.infinity)
                  ..alignment.center(),
              ),
              Parent(
                style: ParentStyle()
                  ..height(50)
                  ..width(MediaQuery.of(context).size.width)
                  ..background.color(Colors.red[400]),
                child: FlatButton(
                  onPressed: () {
                    logout();
                  },
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsItemStyle(pressed),
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped)),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(widget.iconBgColor),
            child: Icon(widget.icon, color: Colors.white, size: 20),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title, style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 2,),
              Text(widget.description, style: Theme.of(context).textTheme.subtitle1),
            ],
          )
        ],
      ),
    );
  }

  final settingsItemStyle = (pressed) => ParentStyle()
    ..elevation(pressed ? 0 : 30, color: Colors.grey)
    ..scale(pressed ? 0.95 : 1.0)
    ..alignmentContent.center()
    ..height(70)
    ..margin(vertical: 10, horizontal: 15)
    ..borderRadius(all: 15)
    ..background.hex('#ffffff')
    ..ripple(true)
    ..animate(250, Curves.easeOutQuart);

  final settingsItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);
}
