import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:randevu/models/side_drawer.dart';

import 'package:randevu/screens/welcomeHasta/components/body.dart';

class HastaWelcomeScreen extends StatelessWidget {
  const HastaWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
