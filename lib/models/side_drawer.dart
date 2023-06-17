/*
import 'package:flutter/material.dart';
import 'package:randevu/models/custom_list_tile.dart';
import 'package:randevu/models/menu_model.dart';
import 'package:randevu/notifiers/menu_notifier.dart';
import 'package:provider/provider.dart';

class CustomSideDrawer extends StatefulWidget {
  @override
  _CustomSideDrawerState createState() => _CustomSideDrawerState();
}

late int currentSelectedIndex;

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  @override
  void initState() {
    MenuDrawerNotifier menuDrawerNotifier =
    Provider.of<MenuDrawerNotifier>(context, listen: false);
    currentSelectedIndex = menuDrawerNotifier.getCurrentDrawer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Provider.of<MenuDrawerNotifier>(context, listen: false);

    return Container(
      width: 250,
      color: Colors.blue,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CustomListTile(
            onTap: () {
              switch (index) {
                case 0:
                  drawer.setCurrentDrawer(0);
                  Navigator.popAndPushNamed(context, "home");
                  break;

                case 1:
                  drawer.setCurrentDrawer(1);
                  Navigator.popAndPushNamed(context, "signup");
                  break;

                case 2:
                  drawer.setCurrentDrawer(2);
                  Navigator.popAndPushNamed(context, "login");
                  break;

                case 3:
                  drawer.setCurrentDrawer(3);
                  Navigator.popAndPushNamed(context, "seotalep");
                  break;

                case 4:
                  drawer.setCurrentDrawer(4);
                  Navigator.popAndPushNamed(context, "adminlogin");
                  break;
                case 5:
                  drawer.setCurrentDrawer(6);
                  Navigator.popAndPushNamed(context, "dailydatas");
                  break;
                case 6:
                  drawer.setCurrentDrawer(6);
                  Navigator.popAndPushNamed(context, "doktormodels");
                  break;

              }
            },
            title: navigationItems[index].title,
            isSelected: currentSelectedIndex == index,
            icon: navigationItems[index].icon,
          );
        },
        itemCount: navigationItems.length,
      ),
    );
  }
}*/