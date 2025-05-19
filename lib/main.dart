// File: lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Sign Up',
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5F7),
      body: Center(
        child: Container(
          width: 768,
          height: 480,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                right: isSignUp ? -764 : 384,
                curve: Curves.easeInOutBack,
                child: AuthForm(
                  title: 'Create Account',
                  inputs: const ['Name', 'Email', 'Password'],
                  onSubmit: () {},
                  buttonText: 'Sign Up',
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                left: isSignUp ? 384 : -764,
                curve: Curves.easeInOutBack,
                child: AuthForm(
                  title: 'Sign in',
                  inputs: const ['Email', 'Password'],
                  onSubmit: () {},
                  buttonText: 'Sign In',
                  showSocial: true,
                ),
              ),
              Positioned(
                top: 0,
                left: isSignUp ? 0 : 384,
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: isSignUp ? 0 : 384,
                  child: Container(
                    width: 384,
                    height: 480,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0D3B3D), Color(0xFF0E4B4D)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            !isSignUp ? 'Hello, Friend!' : 'Welcome Back!',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            !isSignUp
                                ? 'Enter your personal details and start your journey with us'
                                : 'To keep connected with us please login with your personal info',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 24),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 45,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed:
                                () => setState(() => isSignUp = !isSignUp),
                            child: Text(!isSignUp ? 'Sign In' : 'Sign Up'),
                          ),
                        ],
                      ),
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
}

class AuthForm extends StatelessWidget {
  final String title;
  final List<String> inputs;
  final VoidCallback onSubmit;
  final String buttonText;
  final bool showSocial;

  const AuthForm({
    super.key,
    required this.title,
    required this.inputs,
    required this.onSubmit,
    required this.buttonText,
    this.showSocial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 384,
      height: 480,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...inputs.map(
            (placeholder) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: placeholder,
                  fillColor: const Color(0xFFEEEEEE),
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D3B3D),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
          ),
          if (showSocial) ...[
            const SizedBox(height: 20),
            const Text('Or sign in with'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D3B3D),
              ),
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D3B3D),
              ),
              child: const Text('Sign in with Microsoft'),
            ),
          ],
        ],
      ),
    );
  }
}
