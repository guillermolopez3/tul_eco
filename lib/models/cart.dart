import 'package:equatable/equatable.dart';
import 'package:tul_eco/models/product.dart';

class Cart extends Equatable {
  final Product products;
  final int cantidad;

  const Cart({required this.products, required this.cantidad});

  Cart copyWith({
    Product? products,
    int? cantidad,
  }) {
    return Cart(
      products: products ?? this.products,
      cantidad: cantidad ?? this.cantidad,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [products, cantidad];
}
