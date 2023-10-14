import 'package:bus_ticketing_app/screens/conducture/bus_wallet.dart';
import 'package:bus_ticketing_app/screens/conducture/con_bus_details.dart';
import 'package:bus_ticketing_app/screens/conducture/con_notification.dart';
import 'package:bus_ticketing_app/screens/qr_reader_screen.dart';

import 'package:bus_ticketing_app/screens/user/user_proofile.dart';

import 'package:flutter/material.dart';

const mobileScreenSize = 600;
const webScreenSize = 600;

const homeScreenItems = [
  BusDetails(),
  BusWallet(),
  BarcodeScannerApp(),
  ConNotification(),
  UserProfile()
];
