import 'package:flutter/material.dart';
import 'package:randevu/Screens/doktorLogin/components/body.dart';

class DoktorLoginScreen extends StatelessWidget {
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
