
// File: lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/habit_provider.dart';
import '../widgets/habit_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Habits').animate().fadeIn(delay: 300.ms),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: habitProvider.habits.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_nature_rounded, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              'No habits yet!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'Add one from the "Activities" tab.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ).animate().fade(duration: 500.ms),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: habitProvider.habits.length,
        itemBuilder: (context, index) {
          final habit = habitProvider.habits[index];
          return HabitTile(
            habit: habit,
            onChanged: (value) {
              habitProvider.toggleHabitStatus(habit.id, today);
            },
            onDelete: () {
              habitProvider.deleteHabit(habit.id);
            },
            date: today,
          ).animate().slideX(
            delay: (100 * index).ms,
            duration: 400.ms,
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
