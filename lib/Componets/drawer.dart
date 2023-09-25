import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/ripository/item_scroll_controller_model.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              child: Text(
                "Fuma's Portfolio",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic),
              )),
          SizedBox(
            height: size.height / 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(itemScrollControllerProvider).scrollToTopic(0);
              },
              child: const Text(
                "このサイトについて",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
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
          ),
          SizedBox(
            height: size.height / 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
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
          ),
          SizedBox(
            height: size.height / 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
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
          ),
        ],
      ),
    );
  }
}
