import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServices {

  final baseUrl = "http://158.69.62.182:8080/softsalud";


  login(String username,String password)async{

    var url =  Uri.parse( baseUrl + "/api/auth");
    Map dataSend = {
      "password"  : password,
      "username"  : username,
    };
    String body = json.encode(dataSend);
    var response = await http.post(
      url,
      headers:{
        'Content-Type': 'application/json',
      },
      body: body
    );

    if(response.statusCode == 200){

      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      return decodedData;

    }else if (response.statusCode == 401){
      return 0;
    }else if (response.statusCode == 500){
      return 1;
    }else if (response.statusCode == 404){
      return 2;
    }



  }


  registerPatient(Map data)async{

    var sendData = json.encode(data);
    var url = Uri.parse(baseUrl + '/api/v1/ciudadano');
    var response = await http.post(
      url,
      headers:{
        'Content-Type': 'application/json',
      },
      body: sendData
    );

    if(response.statusCode == 200){

      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      return decodedData;

    }else if (response.statusCode == 401){
      return 0;
    }else if (response.statusCode == 500){
      return 1;
    }else if (response.statusCode == 404){
      return 2;
    }

    
  }


  getEspecialidades()async{

    //var token = preferences.getString('token');
    var url = Uri.parse(baseUrl + '/api/v1/especialidad');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'Authorization': 'Bearer' //$token'
      }
    );

    if(response.statusCode == 200){

      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      return decodedData;

    }else if (response.statusCode == 401){
      return 0;
    }else if (response.statusCode == 500){
      return 1;
    }else if (response.statusCode == 404){
      return 2;
    }

  }

}