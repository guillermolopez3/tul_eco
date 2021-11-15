part of 'pedido_bloc.dart';

class PedidoState extends Equatable {
  final List<ProductCarts> listCart;
  final Cart? cart;
  final RemoteStatus remoteStatus;

  const PedidoState({
    this.listCart = const [],
    this.cart,
    this.remoteStatus = RemoteStatus.initial,
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
    List<ProductCarts>? lista,
    Cart? cart,
    RemoteStatus? remoteStatus,
  }) {
    return PedidoState(
        listCart: lista ?? listCart,
        cart: cart ?? this.cart,
        remoteStatus: remoteStatus ?? this.remoteStatus);
  }

  PedidoState cleanState() {
    return const PedidoState(
      listCart: [],
      cart: null,
      remoteStatus: RemoteStatus.initial,
    );
  }

  @override
  List<Object?> get props => [listCart, cart, remoteStatus];
}
