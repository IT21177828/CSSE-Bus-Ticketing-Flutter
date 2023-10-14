import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<UserDetails> {
  int remainingPassengers = 30; // Replace with actual data
  double currentAmount = 150.0; // Replace with actual data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Color.fromARGB(255, 0, 149, 255),
        elevation: 1,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/profile.svg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text("Full Name"),
                Text("Email"),
                Text("Phone Number"),
                Text("LKR : 100.00")
              ],
            ),

            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
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
      ),
    );
  }
}
