import 'package:bus_ticketing_app/screens/conducture/payment_list_item.dart';
import 'package:flutter/material.dart';

class BusWallet extends StatefulWidget {
  const BusWallet({Key? key}) : super(key: key);

  @override
  State<BusWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<BusWallet> {
  Widget _historyListItem() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          // Add your travel history widgets here
          // For example, a list of travel history items
          ListTile(title: Text('Payment 1')),
          ListTile(title: Text('Payment 2')),
          ListTile(title: Text('Payment 3')),
          ListTile(title: Text('Payment 1')),
          ListTile(title: Text('Payment 2')),
          ListTile(title: Text('Payment 3')),
          ListTile(title: Text('Payment 1')),
          ListTile(title: Text('Payment 2')),
          ListTile(title: Text('Payment 3')),
          // Add more ListTile widgets for each trip
        ],
      ),
    );
  }

  Widget _historyList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _historyListItem();
      },
    );
  }

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
        backgroundColor: Color.fromARGB(255, 0, 149, 255),
        title: Text('Bus Wallet'),

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
                  ' 00.00',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              'Payment History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0, // Height of the vertical line
            thickness: 1, // Thickness of the vertical line
            color: const Color.fromARGB(
                255, 0, 40, 72), // Color of the vertical line
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
                        PaymentListItem(
                          title: "Payment 1",
                          amount: "100.00",
                          name: "thilina",
                        ),
                        PaymentListItem(
                          title: "Payment 1",
                          amount: "100.00",
                          name: "thilina",
                        ),
                        PaymentListItem(
                          title: "Payment 1",
                          amount: "100.00",
                          name: "thilina",
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
