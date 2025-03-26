import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabase = SupabaseClient(
    'https://ymesixfvbsnmjejjmtgx.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltZXNpeGZ2YnNubWplamptdGd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4NDU5NzIsImV4cCI6MjA1ODQyMTk3Mn0.oJmxfydu1lHtMyDKZ6Rdel93X2bORVGjWSLJ-gvhGJQ',
  );

  // Add methods for interacting with Supabase here
  Future<PostgrestList> getTodos() async {
    final response = await _supabase.from('todos').select();
    return response..map((todo) => Todo.fromJson(todo)).toList();
  }
}

class Todo {
  final int id;
  final String name;

  Todo({required this.id, required this.name});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      name: json['name'],
    );
  }
}