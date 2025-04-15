import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitapmate/pages/home.dart';
import 'package:vitapmate/src/rust/frb_generated.dart';


Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        textTheme: GoogleFonts.dmSerifTextTextTheme(),
      ),
      home: const HomePage()
      );
  }
}
