import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicianapp/services/ApiServices.dart';
import 'package:medicianapp/models/Horarios/HorariosModel.dart';

class ApointController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;
    idDoctor = data;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  DateTime focusday = DateTime.now();
  DateTime selectDay = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  ApiServices apiConexion = ApiServices();
  String idDoctor = "";

  List<HorariosModel> listHorarios = [];
  
  selectedDay(DateTime daySelect, DateTime focusDay)async{

    focusday = focusDay;
    selectDay = daySelect;

    //print(focusday);

    final dayFormate = DateFormat('yyyy-MM-dd');
    final dayFinal = dayFormate.format(selectDay);
    print("Id doctor :  $idDoctor");
    var response = await apiConexion.getScheduleByDoctor(dayFinal.toString(),idDoctor.toString());
    
    if(response != 1 && response !=2 && response !=0){

      var response2 = await apiConexion.getHorarioByDoctor(response[0]["idCalendario"].toString());
      print(response2);
      if(response2 != 1 && response2 !=2 && response2 !=0){

        for (var i = 0; i < response2.length; i++) {
          
          listHorarios.add(
            HorariosModel(
              idHorario   : response2[i]['horario']['idHorario'], 
              descripcion : response2[i]['horario']['descripcion']
            )
          );

        }

        

      }

      print(listHorarios);

    }

    update();



  }


}