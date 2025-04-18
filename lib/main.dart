import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/router/routes.dart';
import 'package:vitapmate/src/rust/frb_generated.dart';

//Todo : splash screen

Future<void> main() async {
  await RustLib.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = AppColors.primary;
    final Color accentRed = AppColors.secondary;
    return MaterialApp.router(
      title: "VitapMate",
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,

      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,

        colorScheme: ColorScheme.dark(
          primary: primaryBlue,
          secondary: accentRed,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: GoogleFonts.podkovaTextTheme(ThemeData.dark().textTheme),
        iconTheme: IconThemeData(color: primaryBlue),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accentRed,
          foregroundColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
