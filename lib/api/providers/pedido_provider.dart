import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tul_eco/models/cart.dart';
import 'package:tul_eco/models/product.dart';
import 'package:uuid/uuid.dart';

class PedidoProvider {
  final _db = FirebaseFirestore.instance;

  //cuando agrego un producto al carrito guardo en la bd el estado como pendiente
  //hay un nuevo cart x cada session (hot restar o cuando se vuelve a abrir la app)
  Future<String> saveCart() async {
    final cartsRef = _db.collection('carts');
    try {
      final uuid = const Uuid().v4();
      final response = await cartsRef.add({'id': uuid, 'status': 'Pending'});
      return response.id;
    } catch (e) {
      throw Exception('Error');
    }
  }

  Future<void> saveProductCarts(
      Product product, int cantidad, Cart cart) async {
    final prodCartsRef = _db.collection('product_carts');
    try {
      //verifico si ya tengo agregado ese producto a la BD
      final response = await prodCartsRef
          .where('product_id', isEqualTo: product.id)
          .where('cart_id', isEqualTo: cart.id)
          .get();
      if (response.size == 0) {
        //si no lo tengo, lo agrego
        await prodCartsRef.add(
          {'product_id': product.id, 'cart_id': cart.id, 'quantity': cantidad},
        );
      } else {
        //si lo tengo actualizo la cantidad
        await prodCartsRef
            .doc(response.docs.first.id)
            .update({'quantity': cantidad});
      }
    } catch (e) {
      throw Exception('Error');
    }
  }

  Future<void> removeProduct(Product product, Cart cart) async {
    final prodCartsRef = _db.collection('product_carts');
    try {
      final response = await prodCartsRef
          .where('product_id', isEqualTo: product.id)
          .where('cart_id', isEqualTo: cart.id)
          .get();
      if (response.size != 0) {
        await prodCartsRef.doc(response.docs.first.id).delete();
      }
    } catch (e) {
      throw Exception('Error');
    }
  }

  Future<void> finalizarPedido(Cart cart) async {
    final cartsRef = _db.collection('carts');
    try {
      await cartsRef.doc(cart.id).update({"status": 'Completed'});
    } catch (e) {
      throw Exception('Error');
    }
  }
}
