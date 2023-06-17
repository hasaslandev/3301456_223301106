import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/widgets/doktorGoruntuleme.dart';

class Kategoriler extends StatelessWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconList> iconList = [
      IconList(icon: "assets/images/dentist1.png", ad: "Tümü"),
      IconList(icon: "assets/images/diyetisyen_1.png", ad: "Diyetisyen"),
      IconList(icon: "assets/images/kalpcerah_2.png", ad: "Kalp Cer."),
      IconList(icon: "assets/images/psikoloji_1.png", ad: "Beyin Cer."),
      IconList(icon: "assets/images/beyincerrah1.png", ad: "Psikiyatri"),
      IconList(icon: "assets/images/psikoloji_2.png", ad: "Psikoloji"),
      IconList(icon: "assets/images/denntist_1.png", ad: "Damar Cer."),

    ];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
        itemCount: iconList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (iconList[index].ad == "Tümü") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(category: "Tümü"),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(category: iconList[index].ad),
                  ),
                );
              }
            },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(iconList[index].icon),
                  ),
                ),
                const SizedBox(height: 7),
                Text(iconList[index].ad),
              ],
            ),
          );
        },
      ),
    );
  }
}

class IconList {
  final String icon;
  final String ad;

  IconList({required this.icon, required this.ad});
}
