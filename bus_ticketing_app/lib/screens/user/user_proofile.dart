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
          backgroundColor: Color.fromARGB(255, 0, 149, 255),
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Place title and icon at each end
            children: [
              Text('My Profile'), // Title on the left/start
              IconButton(
                icon: Icon(Icons.exit_to_app), // Icon on the right/end
                onPressed: () {
                  // Define the sign-out action here
                },
              ),
            ],
          ),
          actions: [
            // You can add more actions here if needed
          ],
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
