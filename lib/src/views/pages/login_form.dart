import 'package:books_app/src/business_logic/models/user.dart';
import 'package:books_app/src/business_logic/providers/user_provider.dart';
import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _user = User(
    id: null,
    email: '',
    password: '',
    phone: null,
    name: '',
    isAuth: false,
  );

  final _emailProvider = FocusNode();
  final _passwordProvider = FocusNode();

  @override
  void dispose() {
    _emailProvider.dispose();
    _passwordProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _validatePhone(String value) {
      Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';

      RegExp regex = new RegExp(pattern);

      if (value.isEmpty) {
        return 'Please enter phone';
      } else {
        if (!regex.hasMatch(value))
          return 'Enter valid phone';
        else
          return null;
      }
    }

    String _validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);

      if (value.isEmpty) {
        return 'Please enter email';
      } else {
        if (!regex.hasMatch(value))
          return 'Enter valid email';
        else
          return null;
      }
    }

    String _validatePassword(String value) {
      Pattern pattern =
          r'^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$';

      RegExp regex = new RegExp(pattern);

      if (value.isEmpty) {
        return 'Please enter password';
      } else {
        if (!regex.hasMatch(value))
          return 'Enter valid password';
        else
          return null;
      }
    }

    void saveForm() {
      if (_formKey.currentState.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Processing Data'),
        ));

        _formKey.currentState.save();
        _user.isAuth = true;

        Provider.of<UserProvider>(
          context,
          listen: false,
        ).setUserData(_user);

        print(
          'email: ' +
              _user.email +
              ' password:' +
              _user.password +
              ' phone: ' +
              _user.phone.toString() +
              ' isAuth:' +
              _user.isAuth.toString(),
        );

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        // home navigate
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          '/home',
        );
      } else {
        //validation fail
      }
    }

    final pageBody = Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            //phone
            TextFormField(
              decoration: InputDecoration(
                labelText: 'phone number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: _validatePhone,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailProvider);
              },
              onSaved: (value) {
                _user = User(
                  id: _user.id,
                  email: _user.email,
                  password: _user.password,
                  phone: int.parse(value),
                  name: _user.name,
                  isAuth: _user.isAuth,
                );
              },
            ),

            SizedBox(
              height: 15,
            ),
            //Email
            TextFormField(
              decoration: InputDecoration(
                labelText: 'email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailProvider,
              validator: _validateEmail,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordProvider);
              },
              onSaved: (value) {
                _user = User(
                  id: _user.id,
                  email: value,
                  password: _user.password,
                  phone: _user.phone,
                  name: _user.name,
                  isAuth: _user.isAuth,
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            //Passsword
            TextFormField(
              decoration: InputDecoration(
                labelText: 'password',
                prefixIcon: Icon(Icons.emoji_emotions_rounded),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              focusNode: _passwordProvider,
              validator: _validatePassword,
              onFieldSubmitted: (_) {
                //saveForm();
              },
              onSaved: (value) {
                _user = User(
                  id: _user.id,
                  email: _user.email,
                  password: value,
                  phone: _user.phone,
                  name: _user.name,
                  isAuth: _user.isAuth,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                saveForm();
              },
              child: Text('submit'),
            )
          ],
        ),
      ),
    );
    return AppMainShell(widget: pageBody);
  }
}
