import 'package:digital_helper/Utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  // final List<String> _array = ['1', '2'];
  List<TextEditingController> _controller =
      List.generate(6, (i) => TextEditingController());
  String errorMsg = '';

  Color txtColor = Colors.white;

  @override
  void dispose() {
    for (int i = _controller.length - 1; i >= 0; i--) {
      _controller[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Créer votre compte",
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.black26,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: CustomRegistrationForm(controller: _controller),
            ),
          ],
        ))
      ]),
    );
  }
}
