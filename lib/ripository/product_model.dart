import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/Model/product.dart';

final productSarviceProvider = Provider((ref) {
  return ProductSarvice();
});

//Firestoreや、UIで表示するデータをやり取りするmodel
class ProductSarvice {
  List<Product> products = [];
  List<String> downloadedPath = [];

  //Firestoreからデータを取得する
  Future<void> fetchProducts() async {
    //Firestoreからコレクション'products'(QuerySnapshot)を取得してcollectionに代入。
    final collection =
        await FirebaseFirestore.instance.collection('products').get();

    /*
    docs:     docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    map():    Listの各要素をProductに変換
    toList(): map()から帰ってきたIterableをListに変換する
    */
    final List<Product> products =
        collection.docs.map((doc) => Product(doc)).toList();
    this.products = products;
  }
}
