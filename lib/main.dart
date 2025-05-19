import 'package:flutter/material.dart';
import 'widgets/auth_form.dart';
import 'widgets/switch_panel.dart';

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
                  buttonText: 'Sign Up',
                  onSubmit: () {},
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                left: isSignUp ? 384 : -764,
                curve: Curves.easeInOutBack,
                child: AuthForm(
                  title: 'Sign In',
                  inputs: const ['Email', 'Password'],
                  buttonText: 'Sign In',
                  onSubmit: () {},
                  showSocial: true,
                ),
              ),
              Positioned(
                top: 0,
                left: isSignUp ? 0 : 384,
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: isSignUp ? 0 : 384,
                  child: SwitchPanel(
                    isSignUp: isSignUp,
                    toggle: () => setState(() => isSignUp = !isSignUp),
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
