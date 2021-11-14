import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:tul_eco/models/cart.dart';
import 'package:tul_eco/models/product.dart';

part 'pedido_event.dart';

part 'pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  PedidoBloc() : super(const PedidoState()) {
    on<AddProductEvent>(_onAddProductEvent);
    on<RemovedProductEvent>(_onRemovedProductEvent);
    on<SubmitedPedido>(_onSubmitedPedidoEvent);
  }

  void _onAddProductEvent(AddProductEvent event, Emitter emit) {
    final lista = [...state.listCart];
    try {
      final cart = Cart(cantidad: event.cantidad, products: event.product);
      if (lista.isNotEmpty) {
        final item =
            lista.firstWhereOrNull((e) => e.products.id == event.product.id);
        if (item != null) lista.remove(item);
        print(item);
      }
      if (event.cantidad != 0) lista.add(cart);

      emit(state.copyWith(lista: lista));
    } catch (e) {
      final error = e.toString();
      print(error);
    }
  }

  void _onRemovedProductEvent(RemovedProductEvent event, Emitter emit) {
    final list = [...state.listCart];
    list.removeWhere((e) => e.products.id == event.product.products.id);
    print(list);
    emit(state.copyWith(lista: list));
  }

  void _onSubmitedPedidoEvent(SubmitedPedido event, Emitter emit) async {
    try {} catch (e) {
      //emit(state.copyWith(status: RemoteStatus.failure));
    }
  }
}
