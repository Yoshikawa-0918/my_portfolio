import 'package:flutter/material.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/my_introduction.dart';
import 'package:my_portfolio/Componets/topic_body.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 750) {
      return TopicBody(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeadLine1(text: "About me"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/profile.png',
                  scale: 1.8,
                ),
                const SizedBox(
                  width: 20,
                ),
                const MyIntroduction(),
              ],
            ),
          ],
        ),
      ]);
    } else {
      return TopicBody(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const HeadLine1(text: "About me"),
            Image.asset(
              'assets/images/profile.png',
              scale: 1.8,
            ),
            const MyIntroduction(),
          ],
        ),
      ]);
    }
  }
}
