import 'package:flutter/material.dart';
import 'package:futbolize/pages/login_page.dart';
import 'package:futbolize/pages/manage_devices_page.dart';
import 'package:futbolize/pages/profile_edit_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});    // Updated    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Profile Edits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEditPage()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Devices'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageDevicesPage()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Text('Logout'),
                Spacer(),
                Icon(Icons.logout, color: Colors.red),
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}