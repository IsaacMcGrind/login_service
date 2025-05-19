import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
              style: const TextStyle(color: Colors.white, fontSize: 12, letterSpacing: 1.5),
            ),
          ),
          if (showSocial) ...[
            const SizedBox(height: 20),
            const Text('Or sign in with'),
            const SizedBox(height: 10),
            SocialSignInButton(
              icon: FontAwesomeIcons.google,
              label: 'Google',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SocialSignInButton(
              icon: FontAwesomeIcons.microsoft, // If this line causes an error, use FontAwesomeIcons.windows instead
              label: 'Microsoft',
              onTap: () {},
            ),
          ],
        ],
      ),
    );
  }
}

class SocialSignInButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SocialSignInButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: FaIcon(icon, size: 18),
      label: Text('Sign in with $label'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D3B3D),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
