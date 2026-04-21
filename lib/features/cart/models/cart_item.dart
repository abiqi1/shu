import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clothing_app/features/catalogue/models/product.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({required Product product, @Default(1) int quantity}) =
      _CartItem;
}
