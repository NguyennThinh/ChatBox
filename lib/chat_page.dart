import 'package:chat_box/model/message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isSendButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ChatAppBar(), ViewChat(), NavigationBottom()],
        ),
      ),
    );
  }

  Expanded ViewChat() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            Message message = messages[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: message.isSender!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                message.isSender!
                    ? Container(
                        height: 0,
                        width: 0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(message.user.image!))),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(message.user.image!))),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: message.isSender!
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: message.isSender!
                                ? const Color(0xff20A090)
                                : const Color(0xffF2F7FB),
                            borderRadius: message.isSender!
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                        child: Text(
                          message.message!,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: "Circular",
                              fontSize: 12,
                              color: message.isSender!
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: message.isSender!
                            ? const EdgeInsets.only(left: 5)
                            : const EdgeInsets.only(right: 5),
                        child: const Text(
                          "9:31 AM",
                          style: TextStyle(
                              fontFamily: "Circular",
                              fontSize: 10,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox NavigationBottom() {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            "assets/images/Attach.png",
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Color(0xffe6f5ef),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    isSendButton = true;
                  } else {
                    isSendButton = false;
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: "Write your message",
                  hintStyle: const TextStyle(
                      fontFamily: "Circular", color: Colors.grey, fontSize: 12),
                  suffixIcon: Container(
                    width: 50,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Wrap(
                                direction: Axis.vertical,
                                children: [
                                  const Text(
                                    "Share Content",
                                    style: TextStyle(
                                        fontFamily: "Circular",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ...List.generate(
                                      6, (index) => ShareOption(index))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset("assets/images/files.png"),
                    ),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          isSendButton
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff20A090)),
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/Send.png",
                      color: Colors.white,
                    ),
                  ))
              : Row(
                  children: [
                    Image.asset(
                      "assets/images/camera.png",
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/microphone.png",
                      color: Colors.black,
                    ),
                  ],
                ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget ShareOption(int index) {
    shareConten conten = content[index];
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffF2F8F7),
                image: DecorationImage(image: AssetImage(conten.image!))),
          ),
          const SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: index == content.length - 1
                              ? Colors.white
                              : const Color(0xffF2F8F7)))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${conten.title}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ChatAppBar() {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_backspace_rounded)),
          Stack(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar1.jpg"),
                radius: 22,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  )),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "data",
                  style: TextStyle(
                      fontFamily: "Circular",
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Active now",
                  style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/images/phone.png")),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/images/Video.png"),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class shareConten {
  String? title;
  String? decription;
  String? image;
  shareConten(
    this.title,
    this.decription,
    this.image,
  );
}

List content = [
  shareConten("Camera", "", "assets/images/camera.png"),
  shareConten("Document", "Share your file", "assets/images/doc.png"),
  shareConten("Create a poll", "Create a poll for any querry",
      "assets/images/Chart.png"),
  shareConten("Media", "Share photo and video", "assets/images/media.png"),
  shareConten("Contact", "Share your contact", "assets/images/user.png"),
  shareConten("Location", "Share your location", "assets/images/location.png"),
];
