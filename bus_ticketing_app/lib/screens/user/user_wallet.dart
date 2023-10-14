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
        backgroundColor: const Color.fromARGB(255, 51, 170, 255),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LKR',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  ' 00.00',
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
              // Add your button click logic here
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
            child: Text(
              'Travel History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Travel history section
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        // Add your travel history widgets here
                        // For example, a list of travel history items
                        ListTile(title: Text('Trip 1')),
                        ListTile(title: Text('Trip 2')),
                        ListTile(title: Text('Trip 3')),
                        ListTile(title: Text('Trip 1')),
                        ListTile(title: Text('Trip 2')),
                        ListTile(title: Text('Trip 3')),
                        ListTile(title: Text('Trip 1')),
                        ListTile(title: Text('Trip 2')),
                        ListTile(title: Text('Trip 3')),
                        // Add more ListTile widgets for each trip
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
