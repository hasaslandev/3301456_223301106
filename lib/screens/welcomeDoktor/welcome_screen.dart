import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randevu/screens/welcomeDoktor/components/body.dart';

class DoktorWelcomeScreen extends StatelessWidget {
  const DoktorWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
