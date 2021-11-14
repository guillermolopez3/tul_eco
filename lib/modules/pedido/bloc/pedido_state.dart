part of 'pedido_bloc.dart';

class PedidoState extends Equatable {
  final List<Cart> listCart;

  const PedidoState({
    this.listCart = const [],
  });

  int get cantidadProductos => listCart.fold(0, (p, e) => p + e.cantidad);

  double get precioTotal =>
      listCart.fold(0, (p, e) => p + (e.cantidad * (e.products.price)));

  int cantidadAgregado(Product products) {
    int cant = 1;
    for (var cart in listCart) {
      if (cart.products.id == products.id) {
        cant = cart.cantidad;
      }
    }
    return cant;
  }

  PedidoState copyWith({
    List<Cart>? lista,
  }) {
    return PedidoState(
      listCart: lista ?? listCart,
    );
  }

  @override
  List<Object?> get props => [
        listCart,
      ];
}
