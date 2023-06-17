import 'package:flutter/material.dart';
import 'package:randevu/screens/welcomeDoktor/welcome_screen.dart';
import 'package:randevu/screens/welcomeHasta/welcome_screen.dart';


class DoctorLoginScreen extends StatefulWidget {
  @override
  _DoctorLoginScreenState createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  bool isDoctorLoading = false;
  bool isPatientLoading = false;

  void _handleDoctorLogin() {
    setState(() {
      isDoctorLoading = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false, // Kullanıcının arka plana dokunmasını engeller
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // Geri tuşuna basmayı engeller
          child: AlertDialog(
            backgroundColor: Colors.transparent, // Arkaplanı şeffaf yapar
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );

    // Simüle edilen yükleme süresi
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); // Yüklenme tamamlandığında ekranı kapat
      setState(() {
        isDoctorLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoktorWelcomeScreen()),
      );
    });

    // Doktor girişi işlemleri
  }

  void _handlePatientLogin() {
    setState(() {
      isPatientLoading = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false, // Kullanıcının arka plana dokunmasını engeller
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // Geri tuşuna basmayı engeller
          child: AlertDialog(
            backgroundColor: Colors.transparent, // Arkaplanı şeffaf yapar
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );

    // Simüle edilen yükleme süresi
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); // Yüklenme tamamlandığında ekranı kapat
      setState(() {
        isPatientLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HastaWelcomeScreen()),
      );
    });

    // Hasta girişi işlemleri
  }

  Future<bool> _handleWillPop() async {
    if (isDoctorLoading || isPatientLoading) {
      setState(() {
        isDoctorLoading = false;
        isPatientLoading = false;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DOKTOR | HASTA Giriş İşlemleri'),
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
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.medical_services,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 48),
              isDoctorLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _handleDoctorLogin,
                child: Text(
                  'Doktor Girişi',
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
              isPatientLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _handlePatientLogin,
                child: Text(
                  'Hasta Girişi',
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
      ),
    );
  }
}
