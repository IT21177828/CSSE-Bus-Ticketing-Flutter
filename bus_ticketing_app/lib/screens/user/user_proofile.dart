import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String user_Qr;
  final UserType newUser;

  // final String user_Id;
  const UserProfile({required this.user_Qr, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  _UserWalletState createState() => _UserWalletState(user_Qr, newUser);
}

class _UserWalletState extends State<UserProfile> {
  late final String user_Qr;
  late UserType NewUser;

  _UserWalletState(this.user_Qr, this.NewUser);

  @override
  void initState() {
    NewUser = widget.newUser;

    String fName = NewUser.firstName;
    String lName = NewUser.lastName;
    String email = NewUser.emails;
    String gender = NewUser.gender;
    int age = NewUser.age;
    String address = NewUser.address;

    super.initState();
  }

  void _signOut(context) async {
    try {
      // You can navigate to the login or home screen after signing out
      // For example, you can use Navigator.pushReplacement to replace the current screen with a login screen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(), // Replace with your login screen
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String fName = NewUser.firstName;
    String lName = NewUser.lastName;
    String email = NewUser.emails;
    String gender = NewUser.gender;
    int age = NewUser.age;
    String address = NewUser.address;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Container(
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // body: Row(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 7,
                ),
                // elevation:20,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 7, top: 10, bottom: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 42,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1694284028434-2872aa51337b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                            // fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$fName $lName",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Email : $email",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Gender : $gender",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Age : $age',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Address : $address',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Phone Number : 077 123 4567',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),

                            // const SizedBox(
                            //   height: 2,
                            // ),
                            ElevatedButton(
                              onPressed: () {},
                              // style: ButtonStyle(
                              //   fixedSize: MaterialStateProperty.all<Size>(
                              //       const Size(110, 30)),
                              //   elevation: MaterialStateProperty.all(12.0),
                              //   backgroundColor:
                              //       MaterialStateProperty.all<Color>(
                              //     // signInBtn,
                              //   ),

                              //   shape: MaterialStateProperty.all<
                              //       RoundedRectangleBorder>(
                              //     RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(
                              //         12.0,
                              //       ), // Adjust the radius as needed
                              //     ),
                              //   ),
                              // ),
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ),
              /////////////////////////////////////////////////////////

              // Container(
              //   //////////////////////
              //   child: Container(

              // ),

              //////////////////////////////////////////
              // ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _signOut(context);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(110, 30),
                    ),
                    elevation: MaterialStateProperty.all(12.0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
