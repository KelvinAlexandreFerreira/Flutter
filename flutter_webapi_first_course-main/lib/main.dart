import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helpers/async_study.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());

  JournalService service = JournalService();
  service.register("Olá Mundo!");
  //service.get();
  asyncStudy();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          textTheme: GoogleFonts.bitterTextTheme()),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
      },
    );
  }
}
