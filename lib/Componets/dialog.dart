import 'package:flutter/material.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/h3.dart';
import 'package:my_portfolio/Model/product.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProductDialog extends StatefulWidget {
  Product product;
  ProductDialog({
    super.key,
    required this.product,
  });
  @override
  State<StatefulWidget> createState() {
    return ProductDialogState();
  }
}

class ProductDialogState extends State<ProductDialog> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 750) {
      //PCの場合
      return Dialog(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel)),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLine1(text: widget.product.title ?? ""),
                            HeadLine3(text: widget.product.subTitle ?? ""),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Content(text: widget.product.description ?? ""),
                            const HeadLine3(text: "URL"),
                            const Divider(
                              color: Colors.grey,
                            ),
                            TextButton(
                              onPressed: () {
                                launchUrl(
                                    Uri.parse(widget.product.url.toString()));
                              },
                              child: Text(widget.product.url ?? ""),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLine3(text: "スクリーンショット"),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: widget.product.imagesPath!.length,
                              itemBuilder: (context, index) {
                                return AspectRatio(
                                  aspectRatio: 1.61 / 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.blue, width: 2.0)),
                                      child: Image.network(
                                          widget.product.imagesPath![index]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      //タブレット・スマホの場合
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.cancel)),
                    ),
                    HeadLine1(text: widget.product.title!),
                    HeadLine3(text: widget.product.subTitle!),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Content(text: widget.product.description!),
                    const HeadLine3(text: "URL"),
                    const Divider(
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(widget.product.url!.toString()));
                      },
                      child: Text(widget.product.url!),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const HeadLine3(text: "スクリーンショット"),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.product.imagesPath!.length,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 1.61 / 1,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.blue, width: 2.0)),
                                  child: Image.network(
                                      widget.product.imagesPath![index]),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
