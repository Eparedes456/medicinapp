import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medicianapp/pages/Login/LoginPage.dart';
import 'package:medicianapp/services/ApiServices.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
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
  final ImagePicker _picker = ImagePicker();
  String base64Image = "";
  late Uint8List bytes;

  registerUser() async {
    if (nameController.text == "" ||
        apeMaController.text == "" ||
        apePaController.text == "" ||
        dniController.text == "" ||
        emailController.text == "" ||
        userController.text == "" ||
        passController.text == "") {
      loading("Todos los campos son requeridos.", false);
    } else {
      if (base64Image == "" || base64Image == null) {
        loading("La foto de perfil es requerida", false);
      } else {
        loading("Guardando los datos..", true);

        var data = {
          "apellidoMaterno": apeMaController.text,
          "apellidoPaterno": apePaController.text,
          "dni": dniController.text,
          "email": emailController.text,
          "estado": true,
          "idUsuario": 0,
          "login": userController.text,
          "nombre": nameController.text,
          "password": passController.text,
          "foto": base64Image
        };

        var response = await apiConexion.registerPatient(data);
        if (response != 1 && response != 2) {
          print('se registro correctamente');
          Get.back();
          loading("Se registro correctamente", false);
          Future.delayed(Duration(seconds: 2), () {
            Get.offAll(LoginPage());
          });
        } else {
          print('algo salio mal');
          Get.back();
        }
      }
    }
  }

  loading(String mensaje, bool loading) async {
    Get.dialog(AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loading == true ? CircularProgressIndicator() : Container(),
          SizedBox(
            height: 12,
          ),
          Text(mensaje)
        ],
      ),
    ));
  }

  showCameraOpcion() {
    Get.dialog(AlertDialog(
      title: Text('Escoge una de las opciones'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Camara'),
            onTap: () {
              Get.back();
              getImage("camara");
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Galeria'),
            onTap: () {
              Get.back();
              getImage("galeria");
            },
          )
        ],
      ),
    ));
  }

  getImage(String type) async {
    if (type == "camara") {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      print(image);
      if (image == null) {
        return null;
      } else {
        bytes = File(image.path).readAsBytesSync();
        base64Image = base64Encode(bytes);
      }
    } else {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      } else {
        bytes = File(image.path).readAsBytesSync();
        base64Image = base64Encode(bytes);
      }
    }

    update();
  }
}
