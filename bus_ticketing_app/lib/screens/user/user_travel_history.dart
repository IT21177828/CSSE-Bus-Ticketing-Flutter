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
          title: const Text('Travel History'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Travel History',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 74, 134)),
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 151, 151, 151),
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
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.withOpacity(
                                0.6), // Adjust the opacity and colors as needed
                            Colors.blue.withOpacity(0.3),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "#1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
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
