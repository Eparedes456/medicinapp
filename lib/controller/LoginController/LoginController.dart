import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/pages/home/HomePage.dart';
import 'package:medicianapp/services/ApiServices.dart';

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

  login(String userName, String pass)async{

    var response = await apiConexion.login(userName, pass);
    if(response != 1 && response != 2){

      print('ingrese');

      Get.offAll(HomePage());

    }else if(response == 1){
      print('error de servidor');

    }

  }

}