import 'package:flutter/material.dart';
import 'package:randevu/screens/hastaLogin/components/body.dart';


class HastaLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 40,
                color: Colors.black,
              ),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),

      body: Body(),
    );
  }
}
