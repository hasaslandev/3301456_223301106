import 'package:flutter/material.dart';
import 'package:randevu/Screens/Signup/components/background.dart';
import 'package:randevu/Screens/Signup/components/or_divider.dart';
import 'package:randevu/Screens/Signup/components/social_icon.dart';
import 'package:randevu/components/already_have_an_account_acheck.dart';
import 'package:randevu/components/rounded_button.dart';
import 'package:randevu/components/rounded_input_field.dart';
import 'package:randevu/components/rounded_password_field.dart';
import 'package:randevu/models/hastaModel.dart';
import 'package:randevu/screens/hastaLogin/hasta_login_screen.dart';
import 'package:randevu/services/auth/auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:randevu/services/auth/hasta_auth_methods.dart';

class Body extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController TCController = TextEditingController();
  final TextEditingController yasController = TextEditingController();
  final TextEditingController telefonController = TextEditingController();
  final TextEditingController sehirController = TextEditingController();
  final TextEditingController hastaneController = TextEditingController();
  final TextEditingController cinsiyetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            RoundedInputField(
              hintText: "Adınız",
              onChanged: (value) {
                nameController.text = value;
              },
            ),

            RoundedInputField(
              hintText: "Soyadınız",
              onChanged: (value) {
                surnameController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Email Adresiniz",
              onChanged: (value) {
                emailController.text = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "TC",
              onChanged: (value) {
                TCController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Yaş",
              onChanged: (value) {
                yasController.text = value;
              },
            ),

            RoundedInputField(
              hintText: "Hastane",
              onChanged: (value) {
                hastaneController.text = value;
              },

            ),
            RoundedInputField(
              hintText: "Telefon",
              onChanged: (value) {
                telefonController.text = value;
              },

            ),
            RoundedInputField(
              hintText: "Şehir",
              onChanged: (value) {
                sehirController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Cinsiyet",
              onChanged: (value) {
                cinsiyetController.text = value;
              },
            ),

            RoundedButton(
              text: "SIGNUP",
              press: () {
                String name = nameController.text;
                String surname = surnameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String TC = TCController.text;
                int yas = int.tryParse(yasController.text) ?? 0;
                String telefon = telefonController.text;
                String sehir = sehirController.text;
                String hastane = hastaneController.text;
                bool cinsiyet = cinsiyetController.text.toLowerCase() == 'true';

                HastaModel hasta = HastaModel(
                  ad: name,
                  soyad: surname,
                  email: email,
                  sifre: password,
                  TC: TC,
                  yas: yas,
                  telefon: telefon,
                  sehir: sehir,
                  cinsiyet: cinsiyet,
                  hastane: hastane
                );

                context
                    .read<FlutterFireAuthService2>()
                    .createAccount('',name,surname,TC,hastane,email,telefon,sehir,yas,cinsiyet,password);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
