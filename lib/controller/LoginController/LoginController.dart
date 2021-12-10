import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/pages/home/HomePage.dart';
import 'package:medicianapp/services/ApiServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }


  ApiServices apiConexion = ApiServices();
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  login()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    

    var response = await apiConexion.login(userController.text, passController.text);
    if(response != 1 && response != 2){

      print('ingrese');
      preferences.setString('token',response['token']);
      preferences.setString('username', response['user']['nombreCompleto']);
      Get.offAll(HomePage());
      

    }else if(response == 1){
      print('error de servidor');

    }

  }

}