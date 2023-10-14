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
            const SizedBox(
              width: 20,
            ),
            Text(title),
            const SizedBox(
              width: 20,
            ),
            Text(name),
            const SizedBox(
              width: 20,
            ),
            Text("LKR $amount"),
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
