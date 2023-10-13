import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/models/user_model.dart';
import 'package:bus_ticketing_app/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;

  final AuthMethod _authMethod = AuthMethod();

  UserModel get userModel => _userModel!;

  Future<void> refreshUserModel() async {
    UserModel userModel = await _authMethod.getUserDetails();
    _userModel = userModel;
    notifyListeners();
  }
}
