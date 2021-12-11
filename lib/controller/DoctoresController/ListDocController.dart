import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/models/Doctors/DoctorsModel.dart';
import 'package:medicianapp/pages/Appointmen/Appointmen.dart';
import 'package:medicianapp/pages/Doctores/DoctorPage.dart';
import 'package:medicianapp/services/ApiServices.dart';

class LisDocController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;
    nameEspecialidad = data[1];
    getDoctors(data[0]);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  ApiServices apiConexion = ApiServices();
  List<DoctorsModel> doclist = [];
  String nameEspecialidad = "";
  bool loading = true;
  bool haydata = false;

  getDoctors(String idEspecialidad) async {
    var response = await apiConexion.getDoctorbyEspecialidad(idEspecialidad);
    if (response != 1 && response != 2) {
      response.forEach((element) {
        doclist.add(DoctorsModel(
            idDoctor: element["idDoctor"],
            nombreCompleto: element["nombreCompleto"],
            numColegioMed: element["numeroColegioMedico"],
            direccion: element["direccion"],
            foto: element["foto"] == null ? "" : element["foto"].substring(23),
            especialidad: element["especialidad"]["descripcion"],
            documento: element["documento"],
            costo: element['costo'].toString(),
            descripcion: element['descripcion'],
            estado: element["estado"]));
      });

      loading = false;
      haydata = true;
    } else {
      print("algo salio mal");
    }

    update();
  }

  navigateToPerDoc(DoctorsModel doctorData) {
    Get.to(DoctorPage(), arguments: doctorData);
  }

  navigateToAgendar() {
    Get.to(AppointmenPage());
  }
}
