import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/Componets/content.dart';
import 'package:my_portfolio/Componets/dialog.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/h3.dart';
import 'package:my_portfolio/Componets/topic_body.dart';
import 'package:my_portfolio/Model/product.dart';
import 'package:my_portfolio/ripository/product_model.dart';

class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ProductViewState();
  }
}

class ProductViewState extends ConsumerState<ProductsView> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [];
    double cardWidth = 230;
    return TopicBody(
      background: Colors.black12,
      children: <Widget>[
        const HeadLine1(text: "制作物"),
        FutureBuilder(
            future: ref.watch(productSarviceProvider).fetchProducts().then((_) {
              products = ref.watch(productSarviceProvider).products;
            }),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (Product product in products) ...{
                      SizedBox(
                        width: cardWidth,
                        height: cardWidth * 1.6,
                        child: Card(
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
                                      product: product,
                                    );
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                HeadLine3(
                                  text: product.title!,
                                ),
                                Content(
                                  text: product.subTitle!,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    }
                  ],
                );
              } else {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              }
            })
      ],
    );
  }
}
