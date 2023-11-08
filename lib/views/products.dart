import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/Componets/h1.dart';
import 'package:my_portfolio/Componets/product_card.dart';
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
                      ProductCard(product: product)
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
