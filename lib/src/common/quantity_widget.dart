import 'package:flutter/material.dart';
import 'package:green_grocer/src/common/quantity_button.dart';
import 'package:green_grocer/src/constants/constants.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          QuantityButton(
            iconData: Icons.remove,
            color: Colors.grey,
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '1kg',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          QuantityButton(
            iconData: Icons.add,
            color: Constants.customSwatchColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
