import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:green_grocer/src/constants/app_data.dart' as data;
import 'package:green_grocer/src/pages/orders/components/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: data.orders.length,
        itemBuilder: (_, index) {
          log(data.orders[index].id.toString());
          return OrderTile(order: data.orders[index]);
        },
      ),
    );
  }
}
