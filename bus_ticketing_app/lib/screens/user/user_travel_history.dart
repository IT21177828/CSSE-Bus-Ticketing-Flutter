import 'package:bus_ticketing_app/screens/user/travel_history_listitem.dart';
import 'package:flutter/material.dart';

class UserTravelHistory extends StatefulWidget {
  const UserTravelHistory({Key? key}) : super(key: key);

  @override
  State<UserTravelHistory> createState() => _UserTravelState();
}

class _UserTravelState extends State<UserTravelHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: const Text('My Travel History')),
          backgroundColor: const Color.fromARGB(255, 0, 149, 255),
          elevation: 1,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Travel History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Travel history section
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          TravelHistoryListItem(
                              title: "dgd",
                              amount: "amount",
                              entrance: "entrance",
                              exit: "exit"),
                          TravelHistoryListItem(
                              title: "dgd",
                              amount: "amount",
                              entrance: "entrance",
                              exit: "exit"),
                          TravelHistoryListItem(
                              title: "dgd",
                              amount: "amount",
                              entrance: "entrance",
                              exit: "exit")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
