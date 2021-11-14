import 'package:flutter/cupertino.dart';
import 'package:tul_eco/modules/home/ui/home_screen.dart';
import 'package:tul_eco/modules/pedido/ui/pedido_screen.dart';
import 'package:tul_eco/modules/success/ui/success_screen.dart';

class TulEcoNavigator {
  static late TulEcoNavigator _instance;

  static TulEcoNavigator get instance => _instance;
  final GlobalKey<NavigatorState> _navigatorKey;

  const TulEcoNavigator._(this._navigatorKey);

  factory TulEcoNavigator.initNavigator(
          GlobalKey<NavigatorState> navigatorKey) =>
      _instance = TulEcoNavigator._(navigatorKey);

  NavigatorState? get _navigatorState => _navigatorKey.currentState;

  void goPedido() => _navigatorState?.push(PedidoPage.route());
  void goSuccess() => _navigatorState?.push(SuccessScreen.route());
  void goHome() => _navigatorState?.pushAndRemoveUntil(
      HomePage.route(), ModalRoute.withName('Home'));
}
