import 'package:flutter/material.dart';

class TravelHistoryListItem extends StatelessWidget {
  final String title;
  final String route;
  final String amount;

  TravelHistoryListItem({
    required this.title,
    required this.amount,
    required this.route,
  });

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
                child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            Expanded(
              child: Text("$route"),
            ),
            Expanded(
              child: Text(
                "LKR $amount",
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.red),
              ),
            )
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
