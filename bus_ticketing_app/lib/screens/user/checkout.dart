import 'package:flutter/material.dart';

class UserCheckout extends StatefulWidget {
  const UserCheckout({Key? key}) : super(key: key);

  @override
  State<UserCheckout> createState() => _UserTopupState();
}

class _UserTopupState extends State<UserCheckout> {
  TextEditingController CardNumberController = TextEditingController();
  TextEditingController CardHolderNameController = TextEditingController();
  TextEditingController ExpireDateController = TextEditingController();
  TextEditingController CvvController = TextEditingController();

  @override
  void dispose() {
    CardNumberController.dispose();
    CardHolderNameController.dispose();
    ExpireDateController.dispose();
    CvvController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'), // Replace with your image path
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
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 74, 134)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
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
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: CardNumberController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '1234 3456 3435 3453',
                    label: Text('Card Number'),
                    border: InputBorder.none,
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
            margin: EdgeInsets.only(left: 20, right: 20),
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
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: CardHolderNameController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ex. thilina',
                    label: Text('Card Holder Name'),
                    border: InputBorder.none,
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
            margin: EdgeInsets.only(left: 20, right: 20),
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
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: ExpireDateController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '03/26',
                    label: Text('Expire Date'),
                    border: InputBorder.none,
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
            margin: EdgeInsets.only(left: 20, right: 20),
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
            padding: const EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: CvvController,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '345',
                    label: Text('CVV'),
                    border: InputBorder.none,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text('Submit'),
            ),
          ),
        ]
            // child: const Text('Wallet'),
            ),
      ),
    );
  }
}
