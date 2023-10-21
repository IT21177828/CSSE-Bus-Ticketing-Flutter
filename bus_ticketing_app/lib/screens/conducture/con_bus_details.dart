import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  int remainingPassengers = 30; // Replace with actual data
  double currentAmount = 150.0; // Replace with actual data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        backgroundColor: Color.fromARGB(255, 0, 149, 255),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(
            'assets/passenger.svg',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Remaining Passengers: $remainingPassengers',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Over Crouded',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue,
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          // Add more details as needed with appropriate styles
        ],
      ),
    );
  }
}
