
// File: lib/models/habit.dart
import 'package:flutter/cupertino.dart';

class Habit {
  final String id;
  String name;
  String description;
  IconData icon;
  bool isCompleted;
  Map<DateTime, bool> completionStatus;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.isCompleted = false,
    Map<DateTime, bool>? completionStatus,
  }) : this.completionStatus = completionStatus ?? {};
}
