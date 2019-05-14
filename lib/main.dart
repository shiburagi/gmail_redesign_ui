import 'package:flutter/material.dart';
import 'package:gmail_redesign_ui/inbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 235, 37, 54),
      ),
      home: InboxPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

