import 'package:tul_eco/api/providers/pedido_provider.dart';
import 'package:tul_eco/models/cart.dart';
import 'package:tul_eco/models/product.dart';

class PedidoRepository {
  final PedidoProvider _provider = PedidoProvider();

  Future<String> saveCart() => _provider.saveCart();
  Future<void> saveProductCarts(Product product, int cantidad, Cart cart) =>
      _provider.saveProductCarts(product, cantidad, cart);
  Future<void> removeProduct(Product product, Cart cart) =>
      _provider.removeProduct(product, cart);
  Future<void> finalizarPedido(Cart cart) => _provider.finalizarPedido(cart);
}
