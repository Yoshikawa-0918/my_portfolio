import 'package:flutter/material.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/topic_body.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedBackState();
  }
}

class FeedBackState extends State<FeedBack> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TopicBody(children: <Widget>[
      const HeadLine1(text: "Contact me"),
      const Content(text: "最後までご覧いただきありがとうございました！"),
      const Content(text: "もしこのサイトについて気になることや聞いてみたいことがございましたら下のボタンからお願いします！"),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.lightBlue)),
        onPressed: () {
          launchUrl(Uri.parse("https://forms.gle/3XKnpCXhypgDLs9t7"));
        },
        child: const Text(
          "お問い合わせ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      const Content(text: "※Googleフォームへ移動します。"),
    ]);
  }
}
