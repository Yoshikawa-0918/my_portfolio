import 'package:flutter/material.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/topic_body.dart';

class AboutThisSite extends StatelessWidget {
  const AboutThisSite({super.key});

  @override
  Widget build(BuildContext context) {
    return TopicBody(
      background: Colors.lightBlue,
      children: const <Widget>[
        HeadLine1(
          text: "Welcome to Fuma's Portfolio!",
          color: Colors.white,
        ),
        Content(
          text: "こんにちは！閲覧いただきありがとうございます！",
          color: Colors.white,
        ),
        Content(
          text: "ここは吉川楓馬のポートフォリオサイトです。",
          color: Colors.white,
        ),
        Content(
          text: "私のスキルや制作物を知って欲しいという思いを込めてこのサイトを作りました。",
          color: Colors.white,
        ),
        Content(
          text: "ぜひ最後まで閲覧いただけると幸いです！！",
          color: Colors.white,
        ),
      ],
    );
  }
}
