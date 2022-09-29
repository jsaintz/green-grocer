// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:green_grocer/src/common/quantity_widget.dart';
import 'package:green_grocer/src/constants/constants.dart';

import 'package:green_grocer/src/models/cart_item_model.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          cartItem.itemModel.imgUrl,
          height: 60,
          width: 60,
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            color: Constants.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(
          cartItem.itemModel.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: QuantityWidget(
          value: cartItem.quantity,
          suffixText: cartItem.itemModel.unit,
          result: (quantity) {},
        ),
      ),
    );
  }
}
