import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/ripository/item_scroll_controller_model.dart';

class Header extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return HeaderState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 750) {
      return AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          "Fuma's Portfolio",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width / 35,
              fontStyle: FontStyle.italic),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              ref.read(itemScrollControllerProvider).scrollToTopic(0);
            },
            child: const Text(
              "このサイトについて",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(itemScrollControllerProvider).scrollToTopic(1);
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: const Text(
              "自己紹介",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(itemScrollControllerProvider).scrollToTopic(2);
            },
            icon: const Icon(
              Icons.code,
              color: Colors.black,
            ),
            label: const Text(
              "制作物",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(itemScrollControllerProvider).scrollToTopic(3);
            },
            icon: const Icon(
              Icons.mail,
              color: Colors.black,
            ),
            label: const Text(
              "お問い合わせ",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          "Fuma's Portfolio",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width / 20,
              fontStyle: FontStyle.italic),
        ),
      );
    }
  }
}
