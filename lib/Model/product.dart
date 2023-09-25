import 'package:cloud_firestore/cloud_firestore.dart';

//FirestoreのDocumentを扱うクラス
class Product {
  String? title;
  String? subTitle;
  String? description;
  String? url;
  List<String>? imagesPath;

  Product(DocumentSnapshot doc) {
    title = doc['title'];
    subTitle = doc['subTitle'];
    description = doc['description'];
    url = doc['URL'];
    imagesPath = List.from(doc['images']);
  }
}
