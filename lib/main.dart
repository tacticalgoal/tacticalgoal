import 'package:flutter/material.dart';
import 'routes.dart';
import 'utils/theme.dart'; // Import your AppTheme file
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://ymesixfvbsnmjejjmtgx.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltZXNpeGZ2YnNubWplamptdGd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4NDU5NzIsImV4cCI6MjA1ODQyMTk3Mn0.oJmxfydu1lHtMyDKZ6Rdel93X2bORVGjWSLJ-gvhGJQ';
class TactigoalApp extends StatelessWidget {
  const TactigoalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(
    Theme(
      data: AppTheme.theme,
      child: const TactigoalApp(),
    ),
  );
}


