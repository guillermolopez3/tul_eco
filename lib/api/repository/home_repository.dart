import 'package:tul_eco/api/providers/home_provider.dart';
import 'package:tul_eco/models/product.dart';

class HomeRepository {
  final HomeProvider _provider = HomeProvider();

  Future<List<Product>> getProducts() => _provider.getProducts();
}
