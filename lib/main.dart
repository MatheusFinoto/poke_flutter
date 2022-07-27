import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_flutter/src/view/base/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
        scaffoldBackgroundColor: Colors.grey[200],
        primarySwatch: Colors.blue,

      ),
      home: const BaseScreen(),
    );
  }
}
