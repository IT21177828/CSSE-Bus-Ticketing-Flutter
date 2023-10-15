import 'package:bus_ticketing_app/screens/qr_screen.dart';
import 'package:bus_ticketing_app/screens/user/user_proofile.dart';
import 'package:bus_ticketing_app/screens/user/user_topup.dart';
import 'package:bus_ticketing_app/screens/user/user_wallet.dart';
import 'package:bus_ticketing_app/widgets/qr_image.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/screens/user/user_travel_history.dart';
import 'package:logger/logger.dart';


const mobileScreenSize = 600;
const webScreenSize = 600;
final logger = Logger();

const homeScreenItems = [
//   QRImage(controller: 'thilina'),
  UserWallet(),
  UserTopup(),
  UserTravelHistory(),
  UserProfile()
];
