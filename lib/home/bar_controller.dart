import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/resultados_page.dart';
import 'package:funciona_peru/home/pages/home_page.dart';
import 'package:funciona_peru/home/pages/profile_page.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BarController extends StatefulWidget {
  const BarController({super.key});

  @override
  State<BarController> createState() => _BarControllerState();
}

class _BarControllerState extends State<BarController> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> myMainPages = [
      //HomePage(scaffoldKey: _scaffoldKey),
      const HomePage(),
      const ResultadosPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      extendBody: false,
      
      bottomNavigationBar: GNav(
          tabBorderRadius: 35,
          
          rippleColor: color400,
          hoverColor: color500,
          //tabBorder: Border.all(color: Colors.grey, width: 1),
          onTabChange: (index) {
            setState(() {
              myIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          curve: Curves.easeInOut, // tab animation curves
          duration: const Duration(milliseconds: 200), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Theme.of(context).colorScheme.primary, // unselected icon color
          activeColor: greyColor, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              //Colors.deepPurple.shade600, // selected tab background color
              mainColor600,
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 15), // navigation bar padding
          tabs: const [
            GButton(
              icon: CupertinoIcons.home,
              text: 'Inicio',
            ),
            GButton(
              icon: CupertinoIcons.heart_fill,
              text: 'Favoritos',
            ),
            GButton(
              icon: CupertinoIcons.person_circle_fill,
              text: 'Perfil',
            ),
          ]),
      body: myMainPages[myIndex],
    );
  }
}
