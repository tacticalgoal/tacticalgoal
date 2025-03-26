import 'package:flutter/material.dart';

class ManageDevicesPage extends StatelessWidget {
  const ManageDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Devices'),
      ),
      body: Center(
        child: Text('Manage Devices Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}