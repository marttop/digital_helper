import 'package:digital_helper/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        MainLogo(
          imgHeight: MediaQuery.of(context).size.height * 0.35,
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomControllerTextField(
                      fieldText: "Email",
                      validatorText: "Entrez un email valide",
                      myController: emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomControllerTextField(
                      fieldText: "Mot de passe",
                      validatorText: "Entrez un mot de passe valide",
                      myController: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Nouvel utilisateur ?"),
                        FlatButton(
                          child: Text(
                            "Crée un compte",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    StartButton(
                      onBtnPressed: () {},
                      id: 1,
                      btnText: "Connexion",
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialIcon(iconName: 'assets/facebook.png',),
                        SizedBox(width: 10),
                        SocialIcon(iconName: 'assets/twitter.png',),
                        SizedBox(width: 10),
                        SocialIcon(iconName: 'assets/instagram.png',),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
