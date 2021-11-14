import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/modules/pedido/widgets/detalle_compra.dart';
import 'package:tul_eco/modules/pedido/widgets/total_compra.dart';

class PedidoPage extends StatelessWidget {
  const PedidoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => PedidoPage());
  }

  @override
  Widget build(BuildContext context) {
    return const PedidoView();
  }
}

class PedidoView extends StatelessWidget {
  const PedidoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        children: const [
          DetalleCompra(),
          SizedBox(height: 10),
          TotalCompra(),
          SizedBox(height: 10),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
