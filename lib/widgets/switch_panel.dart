import 'package:flutter/material.dart';

class SwitchPanel extends StatelessWidget {
  final bool isSignUp;
  final VoidCallback toggle;

  const SwitchPanel({
    super.key,
    required this.isSignUp,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              isSignUp ? 'Welcome Back!' : 'Hello, Friend!',
              style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              isSignUp
                  ? 'To keep connected with us please login with your personal info'
                  : 'Enter your personal details and start your journey with us',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: toggle,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(isSignUp ? 'Sign In' : 'Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
