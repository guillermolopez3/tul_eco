import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/models/product.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';
import 'package:tul_eco/widgets/button_principal.dart';
import 'package:flutter_svg/svg.dart';

class CardProducts extends StatelessWidget {
  final Product product;

  const CardProducts({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = ButtonsAumentarRestarCantidad(
      product: product,
    );
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.nombre,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Text(
                'SKU: ${product.sku}',
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
              const SizedBox(height: 5),
              Text(
                product.descripcion,
                maxLines: 3,
                style: TextStyle(color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              btn,
              const SizedBox(height: 5),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${product.price}'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ButtonPrincipal(
                    text: 'agregar',
                    press: () {
                      context
                          .read<PedidoBloc>()
                          .add(AddProductEvent(btn.cantSelec, product));
                      Navigator.pop(context);
                    },
                    leftIcon: SvgPicture.asset(
                      'assets/img/carrito.svg',
                      height: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonsAumentarRestarCantidad extends StatefulWidget {
  final Product product;
  int cantSelec = 1;

  ButtonsAumentarRestarCantidad({Key? key, required this.product})
      : super(key: key);

  @override
  State<ButtonsAumentarRestarCantidad> createState() =>
      _ButtonsAumentarRestarCantidadState();
}

class _ButtonsAumentarRestarCantidadState
    extends State<ButtonsAumentarRestarCantidad> {
  @override
  void initState() {
    super.initState();
    widget.cantSelec =
        context.read<PedidoBloc>().state.cantidadAgregado(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 180,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: TextButton(
                  onPressed: () {
                    if (widget.cantSelec > 1) {
                      setState(() {
                        widget.cantSelec--;
                      });
                    }
                  },
                  child: const Center(
                    child: Text(
                      '-',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.only(top: -3)),
                ),
              ),
              BlocBuilder<PedidoBloc, PedidoState>(
                builder: (context, state) {
                  return Text(
                    '${widget.cantSelec}',
                    style: const TextStyle(fontSize: 14),
                  );
                },
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.cantSelec++;
                    });
                  },
                  child: const Center(
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.only(top: -3)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
