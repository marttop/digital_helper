import 'package:flutter/material.dart';

//Reusable logo
class MainLogo extends StatelessWidget {
  final double imgHeight;
  MainLogo({this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/logo_transparent.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

//Start button on the intro page
class StartButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  final int id;
  StartButton({this.btnText, this.onBtnPressed, this.id});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: getPadding(id),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: Theme.of(context).primaryColor,
    );
  }

  EdgeInsets getPadding(int id) {
    if (id == 0)
      return (EdgeInsets.all(18.0));
    else if (id == 1)
      return (EdgeInsets.all(10.0));
    else
      return null;
  }
}

//Custom TextField with validator and controller
class CustomControllerTextField extends StatelessWidget {
  final String fieldText;
  final String validatorText;
  final myController;
  CustomControllerTextField(
      {this.fieldText, this.validatorText, this.myController});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: fieldText, labelStyle: TextStyle(fontSize: 20)),
      controller: myController,
      validator: (value) {
        if (value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      obscureText: isPassword(fieldText),
    );
  }

  bool isPassword(String str) {
    if (str == "Mot de passe" || str == "Password") {
      return true;
    } else
      return false;
  }
}

class SocialIcon extends StatelessWidget {
  final String iconName;
  SocialIcon({this.iconName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(iconName),
      width: 40,
      height: 40,
    );
  }
}
