import 'dart:async';

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
    return Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/logo.png', height: 100),
            SizedBox(height: 20),
            Text('FUTBOLIZE', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Color(0xFF4D514E),),
          ],
        ),
      ),
    );
  }
}