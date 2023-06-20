import 'package:flutter/material.dart';
import 'package:randevu/pages/editBildirimView.dart';
import 'package:randevu/screens/doktorEdit.dart';
import 'package:randevu/screens/hastaEdit.dart';


class AdminWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Paneli'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hoş Geldiniz, Admin',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {


              },
              child: Text(
                'Teklif Edit',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HastaEdit()),
                );
              },
              child: Text(
                'Hasta Edit',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoktorEdit()),
                );
              },
              child: Text(
                'Doktor Edit',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditBildirimView()),
                );
              },
              child: Text(
                'Bildirimler',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
