// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    nombre: json['nombre'] as String,
    price: (json['price'] as num).toDouble(),
    sku: json['sku'] as String,
    descripcion: json['descripcion'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'price': instance.price,
      'sku': instance.sku,
      'descripcion': instance.descripcion,
      'image': instance.image,
    };
