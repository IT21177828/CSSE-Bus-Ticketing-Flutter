import 'package:flutter/material.dart';

class ConNotification extends StatefulWidget {
  const ConNotification({Key? key}) : super(key: key);

  @override
  State<ConNotification> createState() => _UserTravelState();
}

class _UserTravelState extends State<ConNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          backgroundColor: Color.fromARGB(255, 0, 149, 255),
          elevation: 1,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Notification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
                          ListTile(title: Text('Notification 1')),
                          ListTile(title: Text('Notification 2')),
                          ListTile(title: Text('Notification 3')),
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
