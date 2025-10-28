import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CheqrApp());
}

class CheqrApp extends StatelessWidget {
  const CheqrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheqr - AI Fact Checker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

