import 'package:flutter/material.dart';

class UserTravelHistory extends StatefulWidget {
  const UserTravelHistory({Key? key}) : super(key: key);

  @override
  State<UserTravelHistory> createState() => _UserTravelState();
}

class _UserTravelState extends State<UserTravelHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: const Text('My Travel History')),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Travel History',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Travel history section
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
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
        ));
  }
}
