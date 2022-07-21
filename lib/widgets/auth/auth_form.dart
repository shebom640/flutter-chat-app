import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  String _userEmail = '';
  String _username = '';
  String _userPassword = '';


  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid) {
      _formkey.currentState?.save();
      print(_userEmail);
      print(_username);
      print(_userPassword);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    onSaved: (value) {
                      _userEmail = value as String;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty || value.length < 2) {
                        return 'Please Enter at least 2 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (value) {
                      _username = value as String;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty || value.length < 7) {
                        return 'Password must be atleast 7 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value as String;
                    },
                  ),
                  SizedBox(height: 12,),
                  MaterialButton(onPressed: () => _trySubmit(), child: const Text("Login"), color: Theme.of(context).colorScheme.primary,),
                  MaterialButton(onPressed: () {}, child: const Text("CREATE NEW ACCOUNT"), textColor: Theme.of(context).colorScheme.primary)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
