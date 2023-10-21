import 'package:bus_ticketing_app/screens/user/travel_history_listitem.dart';
import 'package:bus_ticketing_app/screens/user/user_topup.dart';
import 'package:flutter/material.dart';

class UserWallet extends StatefulWidget {
  const UserWallet({Key? key}) : super(key: key);

  @override
  State<UserWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(
        //   padding: const EdgeInsets.only(left: 10),
        //   child: const CircleAvatar(
        //     backgroundImage: AssetImage(
        //         'assets/user_image.png' // Replace with your image path
        //         ),
        //   ),
        // ),
        backgroundColor: const Color.fromARGB(255, 0, 149, 255),
        title: Container(
            alignment: Alignment.center, child: const Text('My Wallet')),

        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Balance',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Color.fromARGB(255, 187, 215, 255),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LKR',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  ' 500.00',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserTopup()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 51, 170, 255),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            ),
            child: const Text(
              'Top Up',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              'Travel History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 10,
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
                          title: "Trip 1",
                          amount: "200.00",
                          entrance: "Kandy",
                          exit: "Malabe",
                        ),
                        TravelHistoryListItem(
                          title: "Trip 2",
                          amount: "500.00",
                          entrance: "Kandy",
                          exit: "Matara",
                        ),
                        TravelHistoryListItem(
                          title: "Trip 3",
                          amount: "300.00",
                          entrance: "Matara",
                          exit: "Colombo",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
