import 'package:equatable/equatable.dart';
import 'package:tul_eco/models/product.dart';

class ProductCarts extends Equatable {
  final Product products;
  final int cantidad;

  const ProductCarts({required this.products, required this.cantidad});

  ProductCarts copyWith({Product? products, int? cantidad}) {
    return ProductCarts(
      products: products ?? this.products,
      cantidad: cantidad ?? this.cantidad,
    );
  }

  @override
  List<Object?> get props => [products, cantidad];
}
