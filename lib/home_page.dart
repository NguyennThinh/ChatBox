import 'package:chat_box/component/call_tab.dart';
import 'package:chat_box/component/contact_tab.dart';
import 'package:chat_box/component/message_tab.dart';
import 'package:chat_box/component/navigation.dart';
import 'package:chat_box/component/setting_tab.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndext = 0;
  final tab = [MessageTab(), CallTab(), ContactTab(), SettingTab()];

  void goToTab(index) {
    setState(() {
      selectIndext = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        onPress: goToTab,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(child: tab[selectIndext]),
    );
  }
}
