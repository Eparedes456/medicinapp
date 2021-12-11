import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/models/Doctors/DoctorsModel.dart';

class DoctorController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DoctorsModel data = Get.arguments;
    loadDocData(data);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  String foto = "";
  String nombre = "";
  String especialidad = "";
  String costo = "";
  String biografia = "";
  String idDoctor = "";
  String codCMP = "";
  late Uint8List photoBase64;

  loadDocData(DoctorsModel data) {
    nombre = data.nombreCompleto;
    especialidad = data.especialidad;
    foto = data.foto;
    biografia = data.descripcion;
    idDoctor = data.idDoctor.toString();
    codCMP = data.numColegioMed;
    costo = data.costo;
    photoBase64 = base64Decode(foto);
    print(foto);
    update();
  }
}
