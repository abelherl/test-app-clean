import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image(
            image: NetworkImage('https://s3.amazonaws.com/tasmeemme.project.mi.thumbnails/resize_805x9000/597/442597.png'),
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 25),
        Center(
          child: Text(
            'Login to Al Shami',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}