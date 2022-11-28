import 'package:chat_box/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_backspace,
                  size: 24,
                )),
            const Spacer(
              flex: 1,
            ),
            const Center(
              child: Text(
                "Log in to Chatbox",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                "Welcome back! Sign in using your social\naccount or email to continue us",
                style: TextStyle(
                    fontSize: 14, fontFamily: "Circular", color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/facebook.png"))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/google.png"))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/apple_black.png"))),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '        OR        ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Circular",
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Your email",
                  labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff24786D)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff24786D)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            Center(
              child: SizedBox(
                  width: 327,
                  height: 48,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff24786D)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Circular",
                          color: Colors.white,
                        ),
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Forgot password?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                      color: Color(0xff24786D)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
