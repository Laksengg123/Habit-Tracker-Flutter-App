
// File: lib/widgets/habit_tile.dart
import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;
  final DateTime date;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onChanged,
    required this.onDelete,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final day = DateTime.utc(date.year, date.month, date.day);
    final isCompleted = habit.completionStatus[day] ?? false;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: CircleAvatar(
          backgroundColor: isCompleted ? Colors.teal : Colors.grey[300],
          child: Icon(
            habit.icon,
            color: isCompleted ? Colors.white : Colors.teal,
          ),
        ),
        title: Text(
          habit.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text(habit.description),
        trailing: Checkbox(
          value: isCompleted,
          onChanged: onChanged,
          activeColor: Colors.teal,
        ),
        onLongPress: () {
          // Delete confirmation
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Delete Habit?'),
                content: Text('Are you sure you want to delete "${habit.name}"?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      onDelete();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}