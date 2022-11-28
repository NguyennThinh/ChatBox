import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key, required this.onPress});
  final Function onPress;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int selectIndex = -1;

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      children: [
        ...List.generate(4, (index) => MenuItem(size, index)),
      ],
    );
  }

  Widget MenuItem(double size, int index) {
    NavigationItem menu = menus[index];

    return InkWell(
      onTap: () {
        setState(() {
          selectIndex = index;
        });

        widget.onPress(selectIndex);
      },
      child: Container(
        height: 90,
        width: size / 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xffEEFAF8), width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(menu.image!,
                color: selectIndex == index ? Color(0xff24786D) : null),
            const SizedBox(
              height: 5,
            ),
            Text(
              menu.title!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: selectIndex == index ? FontWeight.bold : null,
                  color: selectIndex == index
                      ? const Color(0xff24786D)
                      : const Color(0xff797C7B)),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationItem {
  String? image;
  String? title;

  NavigationItem(this.image, this.title);
}

List menus = [
  NavigationItem("assets/images/Message.png", "Message"),
  NavigationItem("assets/images/Call.png", "Calls"),
  NavigationItem("assets/images/user.png", "Contacts"),
  NavigationItem("assets/images/settings.png", "Settings")
];
