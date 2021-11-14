import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';
import 'package:tul_eco/utils/enum_remote_status.dart';
import 'package:tul_eco/utils/routes/tul_eco_navigator.dart';

class ButtonFinalizarCompra extends StatelessWidget {
  const ButtonFinalizarCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 80,
      child: BlocConsumer<PedidoBloc, PedidoState>(
        listenWhen: (pre, cu) => pre.remoteStatus != cu.remoteStatus,
        listener: (context, state) {
          if (state.remoteStatus == RemoteStatus.inProgress) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registrando Pedido'),
              ),
            );
          }
          if (state.remoteStatus == RemoteStatus.success) {
            TulEcoNavigator.instance.goSuccess();
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context.read<PedidoBloc>().add(const SubmitedPedido());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'FINALIZAR COMPRA',
              style: TextStyle(fontSize: 22),
            ),
          );
        },
      ),
    );
  }
}
