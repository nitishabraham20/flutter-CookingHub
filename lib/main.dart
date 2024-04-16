import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_ingredient/screens/tabs.dart';

final theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    //brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: theme,
        //themeMode: ThemeMode.dark,
        home: const TabsScreen(),
      ),
    ),
  );
}
