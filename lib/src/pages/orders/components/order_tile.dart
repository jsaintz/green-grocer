// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/models/cart_item_model.dart';

import 'package:green_grocer/src/models/order_model.dart';
import 'package:green_grocer/src/pages/orders/components/order_status_widget.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _orderItemWidget(orderItem);
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _orderItemWidget(CartItemModel orderItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${orderItem.quantity} ${orderItem.itemModel.unit} '),
          Expanded(child: Text(orderItem.itemModel.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
