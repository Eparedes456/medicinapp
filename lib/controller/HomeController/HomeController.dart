import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/models/Especialidades/EspecialidadesModel.dart';
import 'package:medicianapp/services/ApiServices.dart';

class HomeController extends GetxController{

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

  ApiServices apiConexion = new ApiServices();
  List<EspecialidadesModel> listEspe = [];
  bool loading = true;
  bool hayData = false;

  getEspecialidades()async{

    var response = await apiConexion.getEspecialidades();
    if(response != 1 && response != 2){
      print('hay dta');

      response.forEach((element){

        listEspe.add(
          EspecialidadesModel(
            idEspecialidad  : element['idEspecialidad'],
            nombre          : element['nombre'],
            descripcion     : element['descripcion'],
            estado          : element['estado']
          )
        );

      });

      if(listEspe.length > 0){
        loading = false;
        hayData = true;
      }

    }else if(response == 1){
      print('error de server ');
      loading = false;
      hayData = false;
    }

  }

}