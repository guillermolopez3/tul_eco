part of 'pedido_bloc.dart';

abstract class PedidoEvent extends Equatable {
  const PedidoEvent();
}

class AddProductEvent extends PedidoEvent {
  final int cantidad;
  final Product product;
  const AddProductEvent(this.cantidad, this.product);

  @override
  List<Object?> get props => [cantidad, product];
}

class RemovedProductEvent extends PedidoEvent {
  final ProductCarts product;
  const RemovedProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}

class SubmitedPedido extends PedidoEvent {
  const SubmitedPedido();
  @override
  List<Object?> get props => [];
}

class CleanCarrito extends PedidoEvent {
  const CleanCarrito();
  @override
  List<Object?> get props => [];
}
