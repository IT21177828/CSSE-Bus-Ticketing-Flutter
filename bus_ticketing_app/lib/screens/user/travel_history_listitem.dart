import 'package:flutter/material.dart';

class TravelHistoryListItem extends StatelessWidget {
  final String title;
  final String entrance;
  final String exit;
  final String amount;

  TravelHistoryListItem(
      {required this.title,
      required this.amount,
      required this.entrance,
      required this.exit});

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
            Text("$entrance - $exit"),
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
