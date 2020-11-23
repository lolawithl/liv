import 'package:flutter/material.dart';
import 'package:liv/Services/Auth.dart';
import 'package:liv/Screens/Backgrounds/BackgroundLanding.dart';
import 'package:liv/Components/haveAccount.dart';
import 'package:liv/Components/roundedButton.dart';
import 'package:liv/Screens/Authenticate/Signin.dart';
import 'package:liv/Screens/Authenticate/Register.dart';

class Landing extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 480),
            RoundedButton(
              text: "Entrar",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Signin();
                    },
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: RaisedButton(
                child: Text("Entrar anonimamente"),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();

                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print(result);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            HaveAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
