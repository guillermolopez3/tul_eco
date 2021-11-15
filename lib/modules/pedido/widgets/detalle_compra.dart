import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/models/product_carts.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';

class DetalleCompra extends StatelessWidget {
  const DetalleCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PedidoBloc, PedidoState>(
      listener: (context, state) {
        if (state.cantidadProductos == 0) Navigator.pop(context);
      },
      builder: (context, state) {
        final list = state.listCart;
        return ListView.builder(
          itemCount: list.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            return ItemCompra(product: list[idx]);
          },
        );
      },
    );
  }
}

class ItemCompra extends StatelessWidget {
  final ProductCarts product;
  const ItemCompra({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = product.products.price * product.cantidad;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<PedidoBloc>().add(RemovedProductEvent(product));
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.close, color: Colors.red),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              product.products.nombre,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'x${product.cantidad}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '\$${total.toStringAsFixed(0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
