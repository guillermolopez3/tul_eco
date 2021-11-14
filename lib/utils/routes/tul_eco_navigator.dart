import 'package:flutter/cupertino.dart';

class TulEcoNavigator {
  static late TulEcoNavigator _instance;

  static TulEcoNavigator get instance => _instance;
  final GlobalKey<NavigatorState> _navigatorKey;

  const TulEcoNavigator._(this._navigatorKey);

  factory TulEcoNavigator.initNavigator(
          GlobalKey<NavigatorState> navigatorKey) =>
      _instance = TulEcoNavigator._(navigatorKey);

  NavigatorState? get _navigatorState => _navigatorKey.currentState;
}
