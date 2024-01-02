import 'package:trenda/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Trenda());
}

class Trenda extends StatelessWidget {
  const Trenda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trenda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      initialRoute: AppRoutes.signIn,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
