import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/home_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(

    Flutterspeeduiapp()
  );
}

class Flutterspeeduiapp extends StatefulWidget {
  const Flutterspeeduiapp({super.key});

  @override
  State<Flutterspeeduiapp> createState() => _FlutterspeeduiappState();
}

class _FlutterspeeduiappState extends State<Flutterspeeduiapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme
        )
      )
    );
  }
}