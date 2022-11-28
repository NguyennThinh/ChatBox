import 'package:chat_box/model/user.dart';

class Message {
  User user;
  String? message;
  bool? isSender;

  Message(this.user, this.message, this.isSender);
}

List messages = [
  Message(User("Marina", "assets/images/avatar1.png"), "Hi my love", true),
  Message(User("Marina", "assets/images/avatar1.png"), "I miss you", true),
  Message(User("Anaa", "assets/images/avatar2.png"),
      "Hi hi!ZXzXZXXXXXZXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", false),
  Message(User("Anaa", "assets/images/avatar2.png"), "I miss you, too", false),
  Message(User("Marina", "assets/images/avatar1.png"),
      "I miss the days by your side", false),
  Message(User("Marina", "assets/images/avatar1.png"),
      "I miss fiery night with you", true),
  Message(User("Marina", "assets/images/avatar1.png"), "Hi my love", true),
  Message(User("Marina", "assets/images/avatar1.png"), "Hi my love", true)
];
