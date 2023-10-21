import 'package:bus_ticketing_app/screens/conducture/payment_list_item.dart';
import 'package:flutter/material.dart';

class BusDeduct extends StatefulWidget {
  const BusDeduct({Key? key}) : super(key: key);

  @override
  State<BusDeduct> createState() => _UserWalletState();
}

class _UserWalletState extends State<BusDeduct> {
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
          backgroundColor: Colors.blue,
          title: const Text('Bus Deduct'),

          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
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
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Name:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Balance:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '\$100.00',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Bus Num:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '1234',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Capacity:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '50',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Price:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '\$20.00',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Deduct',
                  style: TextStyle(fontSize: 24),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                ),
              )
            ],
          ),
        ));
  }
}
