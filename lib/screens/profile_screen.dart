import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( // Membungkus konten agar dapat di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Video Preferences Section
              _buildSectionTitle('Video preference'),
              _buildMenuItem(context, 'Download Option', Icons.download),
              _buildMenuItem(context, 'Video playback options', Icons.play_circle_fill),
              SizedBox(height: 20),
              // Account Settings Section
              _buildSectionTitle('Account Settings'),
              _buildMenuItem(context, 'Account Security', Icons.security),
              _buildMenuItem(context, 'Email Notification Preferences', Icons.email),
              _buildMenuItem(context, 'Learning Reminders', Icons.notifications),
              SizedBox(height: 20),
              // Other Account Settings Section
              _buildSectionTitle('Account Settings'),
              _buildMenuItem(context, 'About Learnout', Icons.info),
              _buildMenuItem(context, 'Frequently Asked Questions', Icons.help_outline),
              _buildMenuItem(context, 'Share the Learnout App', Icons.share),
              SizedBox(height: 30),
              // Logout Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: Text("Log Out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation or action here
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}