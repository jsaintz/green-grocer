// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:green_grocer/src/constants/constants.dart';

import 'package:green_grocer/src/models/item_model.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  final ItemModel itemModel;
  final UtilsServices utilsServices = UtilsServices();
  ProductScreen({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(itemModel.imgUrl),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade600, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          itemModel.itemName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Text(
                    utilsServices.priceToCurrency(itemModel.price),
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Constants.customSwatchColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        child: Text(
                          itemModel.description * 10,
                          style: const TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'bot',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
