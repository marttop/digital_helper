import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: MaterialButton(
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
      ),
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
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: fieldText,
            labelStyle: TextStyle(
              fontSize: 20,
            )),
        controller: myController,
        validator: (value) {
          if (value.isEmpty) {
            return validatorText;
          }
          return isMailValid(value, fieldText);
        },
        obscureText: isPassword(fieldText),
      ),
    );
  }

  static bool isPassword(String str) {
    if (str == "Mot de passe" || str == "Password") {
      return true;
    } else
      return false;
  }

  static String isMailValid(String value, String fieldText) {
    if (isPassword(fieldText))
      return null;
    else if (!(value.contains('@') && value.contains('.')))
      return "Entrez une adresse mail valide.";
    else
      return null;
  }
}

class CustomControllerDateField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      firstDate: DateTime(1950),
      lastDate: DateTime(2020),
      fieldLabelText: "Date de naissance",
    );
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

class CustomTextFieldArray extends StatefulWidget {
  final int nbFields;
  final List<String> _array;
  final List<TextEditingController> _controller;
  CustomTextFieldArray(this.nbFields, this._controller, this._array);
  @override
  _CustomTextFieldArrayState createState() => _CustomTextFieldArrayState();
}

class _CustomTextFieldArrayState extends State<CustomTextFieldArray> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildArray(),
    );
  }

  List<Widget> buildArray() {
    List<Widget> _customTextFieldArray = List<Widget>();
    for (int i = 0; i < widget.nbFields; i++) {
      _customTextFieldArray.add(CustomControllerTextField(
        fieldText: widget._array[i],
        validatorText: "Champ obligatoire",
        myController: widget._controller[i],
      ));
      _customTextFieldArray.add(SizedBox(height: 10));
    }
    return _customTextFieldArray;
  }
}

class CustomRegistrationForm extends StatefulWidget {
  final List<TextEditingController> controller;
  final String myValue;
  CustomRegistrationForm({this.controller, this.myValue});
  @override
  _CustomRegistrationFormState createState() => _CustomRegistrationFormState();
}

class _CustomRegistrationFormState extends State<CustomRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 10),
      Text("Informations personnelles",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      CustomControllerTextField(
        fieldText: "Nom",
        validatorText: "Entrez votre nom.",
        myController: widget.controller[0],
      ),
      CustomControllerTextField(
        fieldText: "Prénom",
        validatorText: "Entrez votre Prénom.",
        myController: widget.controller[1],
      ),
      CustomControllerDateField(),
      Text("Informations du compte",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      SizedBox(height: 10),
      CustomControllerTextField(
        fieldText: "Email",
        validatorText: "Entrez votre Email.",
        myController: widget.controller[2],
      ),
      CustomControllerTextField(
        fieldText: "Confirmez email",
        validatorText: "Entrez votre Email.",
        myController: widget.controller[3],
      ),
      CustomControllerTextField(
        fieldText: "Mot de passe",
        validatorText: "Entrez votre mot de passe.",
        myController: widget.controller[4],
      ),
      CustomControllerTextField(
        fieldText: "Confirmez mot de passe",
        validatorText: "Entrez votre mot de passe.",
        myController: widget.controller[5],
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DropdownButton<String>(
          items: <String>['Aspirant', 'Coach'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    ]);
  }
}