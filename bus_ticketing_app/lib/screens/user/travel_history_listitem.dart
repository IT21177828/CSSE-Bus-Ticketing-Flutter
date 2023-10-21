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
            Expanded(
              child: Text(title),
            ),
            Expanded(
              child: Text("$entrance - $exit"),
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
