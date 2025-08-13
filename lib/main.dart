
// File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/habit_provider.dart';
import 'screens/main_scaffold.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: const HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Inter', // Nalla oru font
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScaffold(),
    );
  }
}
