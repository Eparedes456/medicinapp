
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences userPreferences = new  UserPreferences._internal();

  factory UserPreferences(){

    return userPreferences;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs()async {
    this._prefs  = await SharedPreferences.getInstance();
  }

}