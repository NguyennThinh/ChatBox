import 'package:chat_box/model/message.dart';
import 'package:flutter/material.dart';

class CallTab extends StatelessWidget {
  const CallTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Image.asset("assets/images/Search.png")),
              const Text(
                "Call",
                style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/images/call-user.png")
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                "Recent",
                style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Message message = messages[index];
                  return SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(message.user.image!),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 80,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xffF5F6F6)))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${message.user.name}",
                                      style: const TextStyle(
                                          fontFamily: "Circular",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(message.isSender!
                                            ? "assets/images/call_to.png"
                                            : "assets/images/call_receive.png"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Today, 09:30 AM",
                                          style: TextStyle(
                                              fontFamily: "Circular",
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Image.asset("assets/images/Call.png"),
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset("assets/images/Video.png"),
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ))
      ],
    );
  }
}
