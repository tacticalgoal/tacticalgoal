import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user.dart'; // Import the UserModel

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SupabaseClient supabase = Supabase.instance.client;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  // ✅ Function to handle user signup
  Future<void> signUpUser() async {
    setState(() => isLoading = true);

    try {
      // 🔹 Sign up the user using Supabase authentication
      final AuthResponse response = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = response.user;

      if (user != null) {
        // 🔹 Store additional user info in the database
        final newUser = UserModel(
          id: user.id,
          email: emailController.text,
          name: nameController.text,
        );

        await supabase.from('users').insert(newUser.toJson());

        // 🔹 Ensure widget is still active before navigating
        if (!mounted) return;

        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      if (!mounted) return;

      setState(() => errorMessage = error.toString());
    } finally {
  if (mounted) {
    setState(() => isLoading = false);
  }
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Name field
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),

            // 🔹 Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),

            // 🔹 Password field
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),

            const SizedBox(height: 20),

            // 🔹 Signup button
            ElevatedButton(
              onPressed: isLoading ? null : signUpUser,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Sign Up'),
            ),

            // 🔹 Show error message if any
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
