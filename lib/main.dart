import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toolify/pallete.dart';
import 'package:toolify/start_page.dart';
import 'package:dart_openai/dart_openai.dart';

void main() {
  OpenAI.apiKey = "Your openai key";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily, useMaterial3: true)
          .copyWith(
        scaffoldBackgroundColor: Pallete.thirdSuggestionBoxColor,
        appBarTheme: const AppBarTheme(color: Pallete.thirdSuggestionBoxColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}
