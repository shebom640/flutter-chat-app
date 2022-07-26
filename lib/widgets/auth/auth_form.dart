import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);
  final void Function(String email, String password, String username, bool isLogin) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _username = '';
  var _userPassword = '';


  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid) {
      _formkey.currentState?.save();
      widget.submitFn(
        _userEmail,
        _userPassword,
        _username,
        _isLogin
      );
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
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email Address'),
                    onSaved: (value) {
                      _userEmail = value as String;
                    },
                  ),
                  if(!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if(value!.isEmpty || value.length < 2) {
                        return 'Enter a valid username';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Username'),
                    onSaved: (value) {
                      _username = value as String;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if(value!.isEmpty || value.length < 7) {
                        return 'Password must be atleast 7 characters long';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value as String;
                    },
                  ),
                  const SizedBox(height: 12,),
                  MaterialButton(onPressed: _trySubmit, child: Text(_isLogin ? "Login" : "Sign Up!"), color: Theme.of(context).colorScheme.primary,),
                  MaterialButton(onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  }, child: Text(_isLogin ? "CREATE NEW ACCOUNT" : "I already have an account"), textColor: Theme.of(context).colorScheme.primary)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
