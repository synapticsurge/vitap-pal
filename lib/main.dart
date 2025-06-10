import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/core/router/routes.dart';
import 'package:vitapmate/core/rust_gen/frb_generated.dart';

//Todo : splash screen

Future<void> main() async {
  await RustLib.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterprovider);
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
        scaffoldBackgroundColor: AppColors.backgroundDark,

        colorScheme: ColorScheme.dark(
          primary: primaryBlue,
          secondary: accentRed,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundDark,
          foregroundColor: AppColors.foregroundColor,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.backgroundDark,

          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundDark,
         
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
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
