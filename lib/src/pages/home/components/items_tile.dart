import 'package:flutter/material.dart';
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/models/item_model.dart';
import 'package:green_grocer/src/pages/product/product_screen.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class ItemsTile extends StatelessWidget {
  final ItemModel itemModel;

  ItemsTile({Key? key, required this.itemModel}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScreen(itemModel: itemModel),
              ),
            );
          },
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
                      tag: itemModel.imgUrl,
                      child: Image.asset(itemModel.imgUrl),
                    ),
                  ),
                  Text(
                    itemModel.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(itemModel.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.customSwatchColor,
                        ),
                      ),
                      Text(
                        ' /${itemModel.unit}',
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
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: Constants.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
