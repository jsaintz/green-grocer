// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:green_grocer/src/models/item_model.dart';

class CartItemModel {
  ItemModel itemModel;
  int quantity;

  CartItemModel({
    required this.itemModel,
    required this.quantity,
  });
  double totalPrice() => itemModel.price * quantity;
}
