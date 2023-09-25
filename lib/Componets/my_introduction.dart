import 'package:flutter/material.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/h2.dart';
import 'package:url_launcher/url_launcher.dart';

class MyIntroduction extends StatelessWidget {
  const MyIntroduction({super.key});
  final double iconWidth = 22;
  final double iconHeight = 22;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: <Widget>[
          const HeadLine2(text: "吉川 楓馬 (ヨシカワ フウマ)"),
          const Content(
            text:
                "2002年9月18日大分県佐伯市出身。九州産業大学所属。大学では情報科学を専攻しており、個人開発ではFlutterを使ってモバイルアプリを主に開発している。"
                "カンファレンスやLT会といったエンジニアが特定の技術について語り合うイベントが好きで、自身が気になる技術のイベントには積極的に参加している。"
                "「人の役に立ちたい」をモットーに将来は地元をITで支える技術者になりたいと思っている。",
            textAlign: TextAlign.start,
          ),
          TextButton.icon(
              onPressed: () {
                launchUrl(Uri.parse("https://qiita.com/Kyomu777"));
              },
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: iconWidth,
                  height: iconHeight,
                  child: Image.asset(
                    'assets/images/qiita.png',
                  ),
                ),
              ),
              label: const Text(
                "Qiita",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 2,
          ),
          TextButton.icon(
              onPressed: () {
                launchUrl(Uri.parse("https://zenn.dev/yoshikawa_fuma"));
              },
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: iconWidth,
                  height: iconHeight,
                  child: Image.asset(
                    'assets/images/zenn.png',
                  ),
                ),
              ),
              label: const Text(
                "Zenn",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 2,
          ),
          TextButton.icon(
              onPressed: () {
                launchUrl(Uri.parse("https://github.com/Yoshikawa-0918"));
              },
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: iconWidth,
                  height: iconHeight,
                  child: Image.asset(
                    'assets/images/github.png',
                  ),
                ),
              ),
              label: const Text(
                "Github",
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
