import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/dialog.dart';
import 'package:my_portfolio/Componets/h3.dart';
import 'package:my_portfolio/Model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  final GlobalKey _key = GlobalKey();
  double width = 0;
  double height = 0;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = _key.currentContext!.size!.width;
        height = _key.currentContext!.size!.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = 230;
    return SizedBox(
      width: cardWidth,
      height: cardWidth * 1.6,
      child: Card(
        key: _key,
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProductDialog(
                    product: widget.product,
                  );
                });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width,
                height: height / 2,
                color: Colors.white,
                child: Image.network(widget.product.imagesPath![0]),
              ),
              const Spacer(),
              HeadLine3(
                text: widget.product.title!,
              ),
              Content(
                text: widget.product.subTitle!,
                color: Colors.black54,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
