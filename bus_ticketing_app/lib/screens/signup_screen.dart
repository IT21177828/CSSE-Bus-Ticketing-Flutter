// ignore_for_file: unnecessary_null_comparison
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:bus_ticketing_app/Widgets/text_field_input.dart';
import 'package:bus_ticketing_app/resources/auth_method.dart';
import 'package:bus_ticketing_app/responsive/mobile_screen_layout.dart';
import 'package:bus_ticketing_app/responsive/responsive.dart';
import 'package:bus_ticketing_app/responsive/web_screen_layout.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/utils/colors.dart';
import 'package:bus_ticketing_app/utils/utills.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final logger = Logger();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  Uint8List? image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    usernameController.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  void signUpUserData() async {
    String res = '';
    setState(() {
      _isLoading = true;
    });

    if (image != null) {
      res = await AuthMethod().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        bio: bioController.text,
        file: image!,
      );
    } else {
      showSnackBar('Please select an image', context);
      setState(() {
        _isLoading = false;
      });
      return;
    }

    logger.d('isssssssssssssssssssssssssaaaa  ${_isLoading.toString()}');

    logger.d(res);

    if (res == 'Success') {
      setState(() {
        _isLoading = false;
      });
      snackBar(res);
      // navgateToHome();
      logger.d('isssssssssssssssssssssssssaaaa  ${_isLoading.toString()}');
    } else {
      setState(() {
        _isLoading = false;
      });
      snackBar(res);
      logger.d('isssssssssssssssssssssssssaaaa  ${_isLoading.toString()}');
    }
  }

  void snackBar(res) {
    if (res == 'Success') {
      showSnackBar(
        'User created successfully',
        context,
      );
    } else {
      showSnackBar(res, context);
    }
  }

  // void navgateToHome() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => const ResponsiveLayout(
  //         // mobileScreenLayout: MobileScreenLayout(QRCode,userObject),
  //         webScreenLayout: WebScreenLayout(),
  //       ),
  //     ),
  //   );
  // }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
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
          'Sign Up',
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
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '',
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 184),
                //circle avatar
                Stack(
                  children: [
                    image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVoRlmXdh-WdDE4s4LFsOL1p05KKG8_ERrfqVFXaC57xgNLZFMMEqTmNJ8ltgGAYEdEwA&usqp=CAU',
                            ),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 82,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: hintColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                //text feild for username
                TextFieldInput(
                  textEditingController: usernameController,
                  hintText: 'Enter your username',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 24,
                ),
                //text feild email
                TextFieldInput(
                  textEditingController: emailController,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 24,
                ),
                //text feild password
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: 'Enter your password',
                  textInputType: TextInputType.visiblePassword,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                //input field for bio
                TextFieldInput(
                  textEditingController: bioController,
                  hintText: 'Enter your bio',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 24,
                ),
                // button login
                ElevatedButton(
                  onPressed: () {
                    signUpUserData();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    foregroundColor: primaryColor,
                    backgroundColor: signInBtn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: buttonText,
                            fontSize: 20,
                            letterSpacing: 1.5,
                          ),
                        ),
                ),
                //go to signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text("Having an account?",
                          style: TextStyle(
                            color: hintColor,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToLogin();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text(
                          "Login",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
