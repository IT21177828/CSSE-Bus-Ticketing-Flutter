import 'package:flutter/material.dart';

class UserTopup extends StatefulWidget {
  const UserTopup({Key? key}) : super(key: key);

  @override
  State<UserTopup> createState() => _UserTopupState();
}

class _UserTopupState extends State<UserTopup> {
  TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: const Text('Top Up')),
        backgroundColor: const Color.fromARGB(255, 0, 149, 255),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Top Up Amount',
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
            padding: const EdgeInsets.only(left: 60),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'LKR',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 50),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '00.00',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          const SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 51, 170, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                child: Text('Check Out'),
              ),
            ),
          ),
        ]
            // child: const Text('Wallet'),
            ),
      ),
    );
  }
}
