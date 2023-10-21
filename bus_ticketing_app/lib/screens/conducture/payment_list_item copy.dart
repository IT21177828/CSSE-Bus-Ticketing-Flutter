import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {
  final String title;
  final String name;
  final String amount;

  PaymentListItem(
      {required this.title, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            Expanded(
              child: Text(name),
            ),
            Expanded(
              child: Text("LKR $amount"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
