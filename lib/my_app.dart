import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/connexion/check_connexion.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:lpdv_tv/screen_overview.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
          //  navigatorKey: navigatorKey, // ✅ navigatorKey ici, pas key:
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.black,
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              // extensions: <ThemeExtension<dynamic>>[
              //   AppColorsTheme.appColors,
              //   AppTypographieTheme.appTheme,
              // ],
            ),
              home: ConnectivityWrapper(
                child: child!,
              ), // ✅ ConnectivityWrapper DANS MaterialApp
          );
        },
        child: OverviewScreen()
        // HomeScreen()
  );
  }
}
