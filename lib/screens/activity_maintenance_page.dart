
// File: lib/screens/activity_maintenance_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit_provider.dart';

class ActivityMaintenancePage extends StatefulWidget {
  const ActivityMaintenancePage({super.key});

  @override
  _ActivityMaintenancePageState createState() => _ActivityMaintenancePageState();
}

class _ActivityMaintenancePageState extends State<ActivityMaintenancePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  IconData _selectedIcon = Icons.star_rounded;

  final List<IconData> _icons = [
    Icons.star_rounded, Icons.favorite_rounded, Icons.lightbulb_rounded,
    Icons.fitness_center_rounded, Icons.menu_book_rounded, Icons.spa_rounded,
    Icons.palette_rounded, Icons.music_note_rounded, Icons.code_rounded
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<HabitProvider>(context, listen: false).addHabit(_name, _description, _selectedIcon);
      Navigator.of(context).pop(); // Close the modal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New habit added!'), backgroundColor: Colors.green),
      );
    }
  }

  void _showAddHabitDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20, left: 20, right: 20
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Add a New Habit', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Habit Name', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 20),
              const Text('Select an Icon'),
              SizedBox(
                height: 60,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _icons.length),
                  itemCount: _icons.length,
                  itemBuilder: (context, index) {
                    return IconButton(
                      icon: Icon(_icons[index]),
                      color: _selectedIcon == _icons[index] ? Colors.teal : Colors.grey,
                      onPressed: () {
                        setState(() {
                          _selectedIcon = _icons[index];
                        });
                        // Rebuild the modal
                        Navigator.of(context).pop();
                        _showAddHabitDialog();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Habit'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Activities'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: habitProvider.habits.length,
        itemBuilder: (context, index) {
          final habit = habitProvider.habits[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(habit.icon, color: Colors.teal),
              title: Text(habit.name),
              subtitle: Text(habit.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                onPressed: () => habitProvider.deleteHabit(habit.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddHabitDialog,
        label: const Text('Add Habit'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
