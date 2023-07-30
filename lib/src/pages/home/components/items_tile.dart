// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/models/item_model.dart';
import 'package:green_grocer/src/pages/product/product_screen.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class ItemsTile extends StatefulWidget {
  final ItemModel itemModel;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemsTile({
    Key? key,
    required this.itemModel,
    required this.cartAnimationMethod,
  }) : super(key: key);

  @override
  State<ItemsTile> createState() => _ItemsTileState();
}

class _ItemsTileState extends State<ItemsTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductScreen(itemModel: widget.itemModel),
            ),
          ),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.itemModel.imgUrl,
                      child: Image.asset(
                        widget.itemModel.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  Text(
                    widget.itemModel.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.itemModel.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.customSwatchColor,
                        ),
                      ),
                      Text(
                        ' /${widget.itemModel.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Constants.customSwatchColor,
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
