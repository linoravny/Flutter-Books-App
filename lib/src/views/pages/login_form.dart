import 'package:books_app/src/business_logic/models/user.dart';
import 'package:books_app/src/main-shell.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey();
  final _user = User();

  String _validateEmail(String value) {
    if (value == null || value == '') {
      return 'Email is required';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }

  final pageBody = Container(
    child: Text('Login Form'),
    // Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       TextFormField(
    //         decoration: InputDecoration(labelText: 'email'),
    //         keyboardType: TextInputType.emailAddress,
    //         validator: _validateEmail,
    //         onSaved: (val) {
    //           //setState(() => _user.email = val );
    //         },
    //       ),
    //       SizedBox(
    //         height: 12,
    //       ),
    //       // TextFormField(
    //       //   decoration: InputDecoration(labelText: 'Password'),
    //       // )
    //     ],
    //   ),
    // ),
  );

  @override
  Widget build(BuildContext context) {
    return AppMainShell(widget: pageBody);
  }
}
