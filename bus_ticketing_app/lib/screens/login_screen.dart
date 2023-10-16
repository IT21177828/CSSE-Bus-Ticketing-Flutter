import 'dart:convert';
// import 'dart:ffi';

import 'package:bus_ticketing_app/responsive/responsive.dart';
import 'package:bus_ticketing_app/responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/Widgets/text_field_input.dart';
import 'package:bus_ticketing_app/screens/signup_screen.dart';
import 'package:bus_ticketing_app/utils/colors.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:bus_ticketing_app/screens/qr_screen.dart';
import 'package:bus_ticketing_app/screens/qr_reader_screen.dart';
import 'package:http/http.dart' as http;
import 'package:bus_ticketing_app/responsive/mobile_screen_layout.dart';


class UserType {
  final String userID;
  final String emails;
  final List userRole;
  final String qrCode;
  final int accountBalance;
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final String address;



  UserType({required this.userID, required this.emails, required this.userRole, required this.qrCode, required this.accountBalance, required this.firstName, required this.lastName, required this.gender, required this.age, required this.address});
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool isLoading = false;
  String error = '';

//login user
  void loginInUser() async {





    setState(() {
      isLoading = true;
      error = '';
    });

    final String email = emailController.text;
    final String password = passwordController.text;

    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

    // Make an HTTP POST request to the login API
    final response = await http.post(
      Uri.parse('http://192.168.8.101:5050/users/login'),
      headers: headers,
      body: jsonEncode({
        'email': email,
        'passwordHash': password,
      }),
    );



    final newjsonResponse = json.decode(response.body);
    logger.e(newjsonResponse);
    String getUserID = newjsonResponse['user']['_id'];
    String getEmail =newjsonResponse['user']['email'];
    List getRole =newjsonResponse['user']['userRole'];
    logger.e(getEmail);

    String getQr =newjsonResponse['user']['qrCode'];
    int getAccountBalance =newjsonResponse['user']['accountBalance'];
    String getFirstName =newjsonResponse['user']['firstName'];
    String getLastName =newjsonResponse['user']['lastName'];
    String getGender = newjsonResponse['user']['gender'];
    int getAge = newjsonResponse['user']['age'];
    String getAddress = newjsonResponse['user']['address'];
    logger.e(getAddress);


    UserType u = UserType(userID:getUserID, emails:getEmail , userRole: getRole ,qrCode: getQr, accountBalance:getAccountBalance, firstName:getFirstName,lastName:getLastName,gender:getGender,age:getAge,address:getAddress);




    logger.d(newjsonResponse);

    final checkUserTypes =getRole.contains('conductor');

    if (response.body != "Incorrect password") {
      // Login successful, handle the response here
      final String result = response.body; // Assuming the API returns a result
      setState(() {
        isLoading = false;
      });

      if (checkUserTypes) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => BarcodeScannerApp() )
        );
      } else {

        logger.e("g dgugiuwegfikdcghkdgckducbjkdcdjsacj");
        // ignore: use_build_context_synchronously

    // Navigate to the home screen
    // Implement your navigation logic here
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(user_Qr: getQr , newUser: u),
          webScreenLayout: WebScreenLayout(),
        ),
      ),
    );

      }
    } else {
      snackBar('Login failed. Please check your credentials.');
      setState(() {
        isLoading = false;
      });
    }
  }

  void snackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void navigateToHome() {
    // Navigate to the home screen
    // Implement your navigation logic here
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  void setUserQr(userQr) {
    final id = userQr;
    // ignore: void_checks
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: navActivaeColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(''), // Add your image path here
              //   fit: BoxFit.cover,
              // ),
              ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              const CircleAvatar(
                radius: 84,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                  radius: 74,
                  // backgroundImage: NetworkImage(
                  //   // 'https://images.unsplash.com/photo-1681811472561-801b008d75e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
                  // ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Sign In to Continue',
                style: TextStyle(
                  color: postUserNameColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 44),
              TextFieldInput(
                textEditingController: emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: passwordController,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              ElevatedButton(
                onPressed: loginInUser,
                style: ElevatedButton.styleFrom(
                  // minimumSize: const Size(double.infinity, 48),
                  foregroundColor: primaryColor,
                  backgroundColor: signInBtn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttonText,
                          fontSize: 20,
                          letterSpacing: 1.5,
                        ),
                      ),
              ),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: hintColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateToSignup();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Sign Up ",
                        style: TextStyle(
                          color: postUserNameColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),

          )
          
        ),
      ),
    );
  }
}
