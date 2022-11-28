import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../chat_page.dart';
import '../model/user.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/Search.png"))),
              ),
              const Text(
                "Home",
                style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.all(2),
                          height: 58,
                          width: 58,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey),
                              left: BorderSide(
                                color: Colors.grey,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                          )),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "data",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(users.length, (index) => UserStatus(index))
                ],
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                height: 3,
                width: 30,
                color: const Color(0xffE6E6E6),
              )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListChat(),
              )
            ],
          ),
        ))
      ],
    );
  }

// ignore: non_constant_identifier_names
  ListView ListChat() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatPage(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Image.asset("assets/images/trash.png"))
                ],
              ),
              child: Container(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(user.image!),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 2,
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "I miss you! My love",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "3 min",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              color: Color(0xffF04A4C), shape: BoxShape.circle),
                          child: const Center(
                            child: Text("1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding UserStatus(int index) {
    User user = users[index];
    return Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(2),
                height: 58,
                width: 58,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    left: BorderSide(
                      color: Colors.grey,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(user.image!),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.name!,
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ));
  }
}
