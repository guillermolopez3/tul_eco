import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';
import 'package:tul_eco/utils/routes/tul_eco_navigator.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const SuccessScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/done_icon.svg'),
          const SizedBox(height: 20),
          const Center(
            child: Text('Datos enviados correctamente'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                TulEcoNavigator.instance.goHome();
              },
              child: const Text('VOLVER'))
        ],
      ),
    );
  }
}
