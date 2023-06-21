import 'package:flutter/material.dart';
import 'package:randevu/Screens/Signup/components/hasta_body.dart';



class HastaSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),

      body: Body(),
    );
  }
}
