
// File: lib/models/habit_provider.dart
import 'package:flutter/material.dart';
import 'habit.dart';

class HabitProvider extends ChangeNotifier {
  final List<Habit> _habits = [
    Habit(id: '1', name: 'Morning Run', description: 'Run for 30 minutes', icon: Icons.directions_run_rounded),
    Habit(id: '2', name: 'Read a Book', description: 'Read 20 pages', icon: Icons.book_rounded),
    Habit(id: '3', name: 'Drink Water', description: 'Drink 8 glasses of water', icon: Icons.local_drink_rounded),
    Habit(id: '4', name: 'Meditate', description: 'Meditate for 10 minutes', icon: Icons.self_improvement_rounded),
  ];

  List<Habit> get habits => _habits;

  Map<DateTime, List<Habit>> get events {
    Map<DateTime, List<Habit>> eventData = {};
    for (var habit in _habits) {
      for (var entry in habit.completionStatus.entries) {
        if (entry.value) { // if completed
          final day = DateTime.utc(entry.key.year, entry.key.month, entry.key.day);
          if (eventData[day] == null) {
            eventData[day] = [];
          }
          eventData[day]!.add(habit);
        }
      }
    }
    return eventData;
  }

  void addHabit(String name, String description, IconData icon) {
    final newHabit = Habit(
      id: DateTime.now().toString(),
      name: name,
      description: description,
      icon: icon,
    );
    _habits.add(newHabit);
    notifyListeners();
  }

  void toggleHabitStatus(String id, DateTime date) {
    final habit = _habits.firstWhere((h) => h.id == id);
    final day = DateTime.utc(date.year, date.month, date.day);

    // Get current status or default to false
    bool currentStatus = habit.completionStatus[day] ?? false;

    // Toggle the status
    habit.completionStatus[day] = !currentStatus;

    notifyListeners();
  }


  void deleteHabit(String id) {
    _habits.removeWhere((habit) => habit.id == id);
    notifyListeners();
  }
}