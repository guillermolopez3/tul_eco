import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tul_eco/models/product.dart';

class HomeProvider {
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getProducts() async {
    try {
      final snap = await productsRef.get();
      final products = snap.docs
          .map((doc) => doc.data())
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
      return products;
    } catch (e) {
      throw Exception('error');
    }
  }
}
