import 'package:equatable/equatable.dart';
import 'package:tul_eco/utils/enum_cart_status.dart';

class Cart extends Equatable {
  final String id;
  final EnumCartStatus status;

  Cart({required this.id, this.status = EnumCartStatus.pending});

  Cart copyWith({String? id, EnumCartStatus? status}) {
    return Cart(id: id ?? this.id, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [id, status];
}
