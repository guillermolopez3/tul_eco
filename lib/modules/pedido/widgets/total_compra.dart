import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';

class TotalCompra extends StatelessWidget {
  const TotalCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'TOTAL:',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              const SizedBox(width: 30),
              BlocBuilder<PedidoBloc, PedidoState>(
                builder: (context, state) {
                  final total = state.precioTotal.toStringAsFixed(2);
                  return Text(
                    '\$$total',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
        )
      ],
    );
  }
}
