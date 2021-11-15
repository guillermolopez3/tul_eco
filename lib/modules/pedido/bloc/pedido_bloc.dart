import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:tul_eco/api/repository/pedido_repository.dart';
import 'package:tul_eco/models/cart.dart';
import 'package:tul_eco/models/product_carts.dart';
import 'package:tul_eco/models/product.dart';
import 'package:tul_eco/utils/enum_remote_status.dart';

part 'pedido_event.dart';

part 'pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  final PedidoRepository _repository;
  PedidoBloc({required PedidoRepository repository})
      : _repository = repository,
        super(const PedidoState()) {
    on<AddProductEvent>(_onAddProductEvent);
    on<RemovedProductEvent>(_onRemovedProductEvent);
    on<SubmitedPedido>(_onSubmitedPedidoEvent);
    on<CleanCarrito>((event, emit) => emit(state.cleanState()));
  }

  Future<void> _onAddProductEvent(AddProductEvent event, Emitter emit) async {
    final lista = [...state.listCart];
    try {
      final cart =
          ProductCarts(cantidad: event.cantidad, products: event.product);
      if (lista.isNotEmpty) {
        final item =
            lista.firstWhereOrNull((e) => e.products.id == event.product.id);
        if (item != null) lista.remove(item);
      }
      if (event.cantidad != 0) lista.add(cart);

      if (state.cart == null) {
        final id = await _repository.saveCart();
        emit(state.copyWith(lista: lista, cart: Cart(id: id)));
      } else {
        emit(state.copyWith(lista: lista));
      }
      await _repository.saveProductCarts(
          cart.products, event.cantidad, state.cart!);
    } catch (e) {}
  }

  Future<void> _onRemovedProductEvent(
      RemovedProductEvent event, Emitter emit) async {
    try {
      final list = [...state.listCart];
      await _repository.removeProduct(event.product.products, state.cart!);
      list.removeWhere((e) => e.products.id == event.product.products.id);

      emit(state.copyWith(lista: list));
    } catch (e) {}
  }

  void _onSubmitedPedidoEvent(SubmitedPedido event, Emitter emit) async {
    try {
      emit(state.copyWith(remoteStatus: RemoteStatus.inProgress));
      await _repository.finalizarPedido(state.cart!);
      emit(state.copyWith(remoteStatus: RemoteStatus.success));
    } catch (e) {
      emit(state.copyWith(remoteStatus: RemoteStatus.failure));
    }
  }
}
