import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/Componets/drawer.dart';
import 'package:my_portfolio/Componets/header.dart';
import 'package:my_portfolio/ripository/item_scroll_controller_model.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/about_this_site.dart';
import 'package:my_portfolio/views/contact_me.dart';
import 'package:my_portfolio/views/products.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  //ホームページの構成
  final List<Widget> _topics = const [
    AboutThisSite(),
    AboutMe(),
    ProductsView(),
    FeedBack(),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 750) {
      return Scaffold(
        appBar: const Header(),
        body: body(),
      );
    } else {
      return Scaffold(
        appBar: const Header(),
        drawer: const CustomDrawer(),
        body: body(),
      );
    }
  }

  Widget body() {
    return ScrollablePositionedList.builder(
        itemCount: _topics.length,
        itemScrollController:
            ref.read(itemScrollControllerProvider).itemScrollController,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: _topics[index]);
        });
  }
}
