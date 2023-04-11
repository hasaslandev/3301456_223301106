import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeathNeeds extends StatelessWidget {
  const HeathNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(icon: "assets/images/diyetisyen_1.jpg", name: "Diyetisyen"),
      CustomIcon(icon: "assets/images/kalpcerah_2.jpg", name: "Kalp Cer."),
      CustomIcon(icon: "assets/images/psikoloji_1.jpg", name: "Beyin Cer."),
      CustomIcon(icon: "assets/images/beyincerrah_1.jpg", name: "Psikiyatri"),
      CustomIcon(icon: "assets/images/psikoloji_2.jpg", name: "Psikoloji"),
      CustomIcon(icon: "assets/images/denntist_1.jpg", name: "Damar Cer."),
    ];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
        itemCount: customIcons.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(

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
                  child: Image.asset(customIcons[index].icon),
                ),
              ),
              const SizedBox(height: 7),
              Text(customIcons[index].name),
            ],
          );
        },
      ),
    );
  }
}

class CustomIcon {
  final String icon;
  final String name;

  CustomIcon({required this.icon, required this.name});
}
