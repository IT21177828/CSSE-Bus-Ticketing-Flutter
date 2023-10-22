import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/screens/user/travel_history_listitem.dart';
import 'package:bus_ticketing_app/screens/user/user_topup.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';

class UserWallet extends StatefulWidget {
  final String user_Qr;
  final UserType newUser;

  // final String user_Id;
  const UserWallet({required this.user_Qr, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  _UserWalletState createState() => _UserWalletState(user_Qr, newUser);
}

class _UserWalletState extends State<UserWallet> {
  late final String user_Qr;

  late UserType NewUser;

  _UserWalletState(this.user_Qr, this.NewUser);

  @override
  void initState() {
    NewUser = widget.newUser;

    String balance = NewUser.accountBalance.toString();
    logger.e(balance);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int balance = NewUser.accountBalance;

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
        backgroundColor: Colors.blue,
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
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LKR',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "$balance",
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
                MaterialPageRoute(
                  builder: (context) =>
                      UserTopup(user_Qr: user_Qr, newUser: NewUser),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 51, 170, 255),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
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
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "Trip 1",
                            amount: "200.00",
                            route: 'Kandy - Colombo',
                          ),
                          TravelHistoryListItem(
                            title: "Trip 1",
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
          ),
        ],
      ),
    );
  }
}
