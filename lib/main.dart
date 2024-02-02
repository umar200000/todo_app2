import 'package:flutter/material.dart';
import 'package:todo_app2/widget_pages/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.amber,
        fontFamily: "Roboto",
      ),
      home: ToDoScreen(),
    );
  }
}
