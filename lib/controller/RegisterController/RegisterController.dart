
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medicianapp/pages/Login/LoginPage.dart';
import 'package:medicianapp/services/ApiServices.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

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
  TextEditingController nameController = new TextEditingController();
  TextEditingController apeMaController = new TextEditingController();
  TextEditingController apePaController = new TextEditingController();
  TextEditingController dniController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();


  registerUser()async{
    loading();

    var data ={
      "apellidoMaterno" : apeMaController.text,
      "apellidoPaterno" : apePaController.text,
      "dni"             : dniController.text,
      "email"           : emailController.text,
      "estado"          : true,
      "idUsuario"       : 0,
      "login"           : userController.text,
      "nombre"          : nameController.text,
      "password"        : passController.text

    };
    
    var response = await apiConexion.registerPatient(data);
    if(response != 1 &&  response !=2){

      
        print('se registro correctamente');
        Get.offAll(LoginPage());
      

    }else{
      print('algo salio mal');
      Get.back();
    }



  }

  loading()async{

    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12,),
            Text('Guardando los datos..')
          ],
        ),
      )
    );
    
  }



}