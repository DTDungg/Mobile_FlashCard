import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn_Screen extends StatelessWidget{
  const SignIn_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              child: Image(
                  image: AssetImage('assets/images/sign-in.png')
              ),
            ),
          ),

        ],
      )
    );
  }


}