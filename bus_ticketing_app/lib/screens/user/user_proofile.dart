import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.center, child: const Text('My Profile')),
          backgroundColor: const Color.fromARGB(255, 51, 170, 255),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                // User profile picture
                CircleAvatar(
                  radius: 50, // Adjust the size as needed
                  backgroundImage: AssetImage(
                      'assets/user_profile.jpg'), // Replace with your image path
                ),
                SizedBox(height: 20),
                // User name
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // User email
                Text(
                  'johndoe@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                // Add more user information widgets as needed
              ],
            ),
          ),
        ));
  }
}
