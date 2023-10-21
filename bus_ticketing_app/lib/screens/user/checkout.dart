import 'package:flutter/material.dart';

class UserCheckout extends StatefulWidget {
  const UserCheckout({Key? key}) : super(key: key);

  @override
  State<UserCheckout> createState() => _UserTopupState();
}

class _UserTopupState extends State<UserCheckout> {
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
                  'LKR 00.00',
                  style: TextStyle(fontSize: 30),
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
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '1234 3456 3435 3453',
                    label: Text('Card Number'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Color.fromARGB(255, 187, 215, 255),
            padding: const EdgeInsets.only(left: 60),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ex. thilina',
                    label: Text('Card Holder Name'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Color.fromARGB(255, 187, 215, 255),
            padding: const EdgeInsets.only(left: 60),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '03/26',
                    label: Text('Expire Date'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Color.fromARGB(255, 187, 215, 255),
            padding: const EdgeInsets.only(left: 60),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '345',
                    label: Text('CVV'),
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
                child: Text('Submit'),
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
