import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  late Action onNavigationSelection;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(icon: Icons.home_rounded, title: "Home"),
  NavigationModel(icon: Icons.person, title: "Signup"),
  NavigationModel(icon: Icons.person, title: "Login"),
  NavigationModel(icon: Icons.person, title: "SeoTalep"),
  NavigationModel(icon: Icons.person, title: "Admin Login"),
  NavigationModel(icon: Icons.person, title: "Daily Datas"),
  NavigationModel(icon: Icons.person, title: "DoktorModel"),


];

