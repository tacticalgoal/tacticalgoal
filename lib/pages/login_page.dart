import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseClient supabase = Supabase.instance.client;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  bool isLoading = false;
  String? errorMessage;
  StreamSubscription<AuthState>? _authSubscription;

  @override
  void initState() {
    super.initState();
    _checkUserSession();
  }

  // ✅ Check if user is already logged in
  void _checkUserSession() {
  final session = supabase.auth.currentSession;
  if (session != null) { // ✅ No need to check session.user separately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}


  // ✅ Handle user login
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // 🔹 Validate input
    if (email.isEmpty || password.isEmpty) {
      setState(() => errorMessage = "Please enter both email and password.");
      return;
    }

    setState(() => isLoading = true);

    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // 🔹 Navigate to home page after successful login
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      }
      
    } catch (error) {
      setState(() => errorMessage = "Login failed: ${error.toString()}");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 42, 117, 213), Color(0xFF0A0A0A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/logo.png', height: 100),
                const SizedBox(height: 20),

                // 🔹 Email Field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(100),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),

                // 🔹 Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(100),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),

                // 🔹 Forgot Password?
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: const Text('Forgot Password?', style: TextStyle(color: Colors.white70)),
                  ),
                ),

                const SizedBox(height: 10),

                // 🔹 Login Button
                ElevatedButton(
                  onPressed: isLoading ? null : loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 17, 67, 147),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),

                const SizedBox(height: 10),

                // 🔹 Show Error Message if Login Fails
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 10),

                // 🔹 Sign Up Button
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Don’t have an account? Sign Up', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _authSubscription?.cancel(); // ✅ Prevent memory leak
    super.dispose();
  }
}
