// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:green_grocer/src/constants/constants.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _statusDot(isActive: true, title: 'Pedido Confirmado'),
        _customDivider(),
        if (currentStatus == 1) ...[
          _statusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          _statusDot(
            isActive: true,
            title: 'Pagamento Pix Vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _statusDot(
            isActive: currentStatus >= 2,
            title: 'Pagamento',
          ),
          _customDivider(),
          _statusDot(
            isActive: currentStatus >= 3,
            title: 'Preparando',
          ),
          _customDivider(),
          _statusDot(
            isActive: currentStatus >= 4,
            title: 'Envio',
          ),
          _customDivider(),
          _statusDot(
            isActive: currentStatus >= 5,
            title: 'Entregue',
          ),
        ],
      ],
    );
  }

  Widget _statusDot({required bool isActive, required String title, Color? backgroundColor}) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.customSwatchColor,
            ),
            color: isActive ? backgroundColor ?? Constants.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _customDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}
