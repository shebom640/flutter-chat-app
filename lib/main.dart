import 'package:chatapp/screens/auth_screen.dart';
import 'package:chatapp/screens/chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: '',
              appId: '1:556101013216:android:8ec3551c8ccbb6b1550a85',
              messagingSenderId: '556101013216',
              projectId: 'flutter-chat-4e113'))
      .then((value) => print(value));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.deepPurple, primary: Colors.pink),
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: AuthScreen(),
    );
  }
}
