import 'package:flutter/material.dart';
import 'package:randevu/Screens/doktorLogin/login_screen.dart';
import 'package:randevu/Screens/Signup/components/background.dart';
import 'package:randevu/Screens/Signup/components/or_divider.dart';
import 'package:randevu/Screens/Signup/components/social_icon.dart';
import 'package:randevu/components/already_have_an_account_acheck.dart';
import 'package:randevu/components/rounded_button.dart';
import 'package:randevu/components/rounded_input_field.dart';
import 'package:randevu/components/rounded_password_field.dart';
import 'package:randevu/services/auth/auth_methods.dart';
import 'package:provider/provider.dart';

import '../../../models/doktorModel.dart';
class Body extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController starsController = TextEditingController();
  final TextEditingController viewsController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController shortDescController = TextEditingController();
  final TextEditingController longDescController = TextEditingController();

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
              hintText: "Your Name",
              onChanged: (value) {
                nameController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
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
              hintText: "Position",
              onChanged: (value) {
                positionController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Stars",

              onChanged: (value) {
                starsController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Total Views",

              onChanged: (value) {
                viewsController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Profile Picture URL",
              onChanged: (value) {
                imageController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Short Description",
              onChanged: (value) {
                shortDescController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Long Description",
              onChanged: (value) {
                longDescController.text = value;
              },
            ),

            RoundedButton(
              text: "SIGNUP",
              press: () {
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String position = positionController.text;
                int stars = int.tryParse(starsController.text) ?? 0;
                int views = int.tryParse(viewsController.text) ?? 0;
                String image = imageController.text;
                String shortDesc = shortDescController.text;
                String longDesc = longDescController.text;

                DoktorModel doktor = DoktorModel(
                  isim: name,
                  email: email,
                  sifre: password,
                  pozisyon: position,
                  yildiz: stars,
                  toplamGoruntulenme: views,
                  resim: image,
                  bKisaAciklama: shortDesc,
                  bUzunAciklama: longDesc,
                );

                context
                    .read<FlutterFireAuthService>()
                    .createAccount(
                  name, email, password,position,stars,views,image,shortDesc,longDesc
                );
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
                      return DoktorLoginScreen();
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
