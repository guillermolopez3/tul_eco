import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/api/repository/pedido_repository.dart';
import 'package:tul_eco/modules/home/ui/home_screen.dart';
import 'package:tul_eco/modules/pedido/bloc/pedido_bloc.dart';
import 'package:tul_eco/utils/routes/tul_eco_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TulEcoNavigator.initNavigator(_navigatorKey);
    return BlocProvider<PedidoBloc>(
      create: (_) => PedidoBloc(repository: PedidoRepository()),
      child: MaterialApp(
        title: 'Tul Ecommerce',
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'Home',
        routes: {'Home': (context) => const HomePage()},
      ),
    );
  }
}
