import 'package:flutter/material.dart';
import 'package:tul_eco/models/product.dart';
import 'package:tul_eco/modules/home/widgets/home_card.dart';

class HomeProductsList extends StatelessWidget {
  final List<Product> lista;
  const HomeProductsList({Key? key, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemCount: lista.length,
      itemBuilder: (ctx, idx) {
        final prod = lista[idx];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: HomeCard(
            title: prod.nombre,
            subTitle: prod.descripcion,
            img: prod.image,
            price: '${prod.price}',
            onTap: () {},
          ),
        );
      },
    );
  }
}
