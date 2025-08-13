
// File: lib/screens/profile_page.dart (CORRECTED)
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = 'User Name'; // Default name

  // **FIXED CONNECTION LOGIC HERE**
  // This function now correctly opens the edit page and waits for a result.
  void _navigateToEditProfile(BuildContext context) async {
    // We use 'await' to wait for the EditProfilePage to close.
    // The result it sends back will be stored in the 'newName' variable.
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(currentName: _userName),
      ),
    );

    // If the user saved a new name (newName is not null), we update the state.
    if (newName != null && newName is String && newName.isNotEmpty) {
      setState(() {
        _userName = newName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // This button triggers the navigation to the edit page.
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            tooltip: 'Edit Profile',
            onPressed: () => _navigateToEditProfile(context),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://placehold.co/400x400/teal/white?text=User'),
                backgroundColor: Colors.teal,
              ).animate().scale(duration: 500.ms),
              const SizedBox(height: 20),
              // The Text widget now displays the updated _userName.
              Text(
                _userName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ).animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 8),
              Text(
                'Joined: August 2024',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ).animate().fadeIn(delay: 400.ms),
              const SizedBox(height: 40),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.check_circle_outline_rounded, 'Habits Completed', '128'),
                      const Divider(),
                      _buildInfoRow(Icons.star_border_rounded, 'Current Streak', '15 Days'),
                      const Divider(),
                      _buildInfoRow(Icons.insights_rounded, 'Completion Rate', '85%'),
                    ],
                  ),
                ),
              ).animate().slideY(begin: 0.5, delay: 500.ms, duration: 500.ms).fadeIn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
