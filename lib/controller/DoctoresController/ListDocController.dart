import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/models/Doctors/DoctorsModel.dart';
import 'package:medicianapp/services/ApiServices.dart';

class LisDocController extends GetxController{


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
  
  ApiServices apiConexion =  ApiServices();
  List<DoctorsModel> doclist = [];
  String nameEspecialidad = "";

  getDoctors(String idEspecialidad)async{

    var response = await apiConexion.getDoctorbyEspecialidad(idEspecialidad);
    if(response != 1 && response  !=2){


      response.forEach((element){
        doclist.add(
          DoctorsModel(
            idDoctor        : element["idDoctor"],
            nombreCompleto  : element["nombreCompleto"],
            numColegioMed   : element["numeroColegioMedico"],
            direccion       : element["direccion"],
            foto            : element["foto"] == null ? "" :  element["foto"],
            especialidad    : element["especialidad"]["descripcion"],
            documento       : element["documento"],
            estado          : element["estado"]
          )
        );
      });


    }else{  
      print("algo salio mal");
    }

    update();


  }





}