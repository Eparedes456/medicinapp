import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicianapp/services/ApiServices.dart';

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
  
  selectedDay(DateTime daySelect, DateTime focusDay)async{

    focusday = focusDay;
    selectDay = daySelect;

    //print(focusday);

    final dayFormate = DateFormat('yyyy-MM-dd');
    final dayFinal = dayFormate.format(selectDay);
    print("Id doctor :  $idDoctor");
    var response = await apiConexion.getScheduleByDoctor(dayFinal.toString(),idDoctor.toString());
    
    print(response);
    update();



  }


}