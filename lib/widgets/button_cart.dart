import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';
import 'package:tul_eco/utils/routes/tul_eco_navigator.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 80,
      child: BlocBuilder<PedidoBloc, PedidoState>(
        builder: (context, state) {
          final count = state.cantidadProductos;
          return ElevatedButton(
            onPressed: () {
              count > 0
                  ? TulEcoNavigator.instance.goPedido()
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('El carrito está vacío'),
                      ),
                    );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: BlocBuilder<PedidoBloc, PedidoState>(
              builder: (ctx, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartIcon(
                      cantidad: state.cantidadProductos,
                    ),
                    const Text(
                      'VER PEDIDO',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      '\$${state.precioTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  final int cantidad;

  const CartIcon({Key? key, required this.cantidad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cant = cantidad > 9 ? '9+' : '$cantidad';
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/img/carrito.svg',
              height: 30,
            ),
          ),
          Positioned(
            top: 5,
            right: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
              child: Text(
                cant,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
