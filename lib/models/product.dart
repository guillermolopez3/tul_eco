import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String nombre;
  final double price;
  final String sku;
  final String descripcion;
  final String image;

  Product({
    required this.id,
    required this.nombre,
    required this.price,
    required this.sku,
    required this.descripcion,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
