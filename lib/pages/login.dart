import 'package:digital_helper/api/api.dart';
import 'package:digital_helper/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMsg = '';

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
                      onBtnPressed: () async {
                        if (_formKey.currentState.validate()) {
                          var email = emailController.text;
                          var password = passwordController.text;
                          setState(() {
                            errorMsg = 'Patientez...';
                          });
                          var rep = await getLoginUser(email, password);
                          print(rep);
                          if (rep.containsKey('status')) {
                            setState(() {
                              errorMsg = rep['status_text'];
                              if (rep['status'] == 1) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(username: rep['user_arr']['email']);
                                }));
                              } else {
                                setState(() {
                                  errorMsg = 'Login Failed';
                                });
                              }
                            });
                          }
                        }
                      },
                      id: 1,
                      btnText: "Connexion",
                    ),
                    Text(errorMsg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialIcon(
                          iconName: 'assets/facebook.png',
                        ),
                        SizedBox(width: 10),
                        SocialIcon(
                          iconName: 'assets/twitter.png',
                        ),
                        SizedBox(width: 10),
                        SocialIcon(
                          iconName: 'assets/instagram.png',
                        ),
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
