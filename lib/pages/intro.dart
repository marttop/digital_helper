import 'package:digital_helper/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: MainLogo(
              imgHeight: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Recevoir de l'aide en ligne dans tout les domaines",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StartButton(
                      btnText: "Découvrir",
                      id: 0,
                      onBtnPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
