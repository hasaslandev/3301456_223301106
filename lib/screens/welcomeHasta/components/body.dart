import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:randevu/Screens/Signup/signup_screen.dart';
import 'package:randevu/components/rounded_button.dart';
import 'package:randevu/constants.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/screens/hastaLogin/hasta_login_screen.dart';
import 'package:randevu/screens/signup/hasta_signup_screen.dart';
import 'package:randevu/translations/locale_keys.g.dart';
import 'package:randevu/screens/welcomeHasta/components/background.dart';



class Body extends StatelessWidget {
  changeLocale(context) async {
    if (context.locale == "en_US") {
      await context.setLocale(Locale('tr'));
    } else {
      await context.setLocale(Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomePage(category: "Tümü");
    }
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await context.setLocale(Locale('tr', 'TR'));
                      },
                      child: Text("Türkçe")),
                  ElevatedButton(
                      onPressed: () async {
                        await context.setLocale(Locale('en', 'US'));
                      },
                      child: Text("English")),
                ],
              ),
            ),
            Text(
              LocaleKeys.welcome.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(LocaleKeys.appname.tr()),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/kalpcerrah_1.png",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: LocaleKeys.sicklogin.tr(),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HastaLoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: LocaleKeys.sicksingup.tr(),
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HastaSignUpScreen();
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
