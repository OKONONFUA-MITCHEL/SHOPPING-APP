import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(254, 206, 1, 1),
          shape: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Color.fromARGB(255, 65, 65, 65),
              style: BorderStyle.solid,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 60,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 65, 65, 65),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      title: 'TradeKicks',
      home: const HomePage(),
    );
  }
}
