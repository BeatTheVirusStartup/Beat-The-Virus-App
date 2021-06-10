import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:beat_the_virus/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> _allProducts = [];

  List<Products> get allProducts {
    return [..._allProducts];
  }

  Future<void> getProductsByCountry(String country) async {
    try {
      List<Products> products = await Amplify.DataStore.query(
          Products.classType,
          where: Products.COUNTRY.eq(country),
          sortBy: [Products.NAME.ascending()]);
      _allProducts = products;
      notifyListeners();
    } on DataStoreException catch (e) {
      print('Query failed: $e');
    }
  }

  List<Products> filterByCategory(String cat) {
    return [..._allProducts.where((Products prod) => prod.category == cat)];
  }
}
