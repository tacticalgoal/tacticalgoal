import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Edit'),
      ),
      body: Center(
        child: Text('Profile Edit Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}