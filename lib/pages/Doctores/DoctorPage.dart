import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/controller/DoctoresController/DoctorController.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorController>(
      init: DoctorController(),
      builder: (_) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              //color: Colors.black,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 30,
                    left: 12,
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white)),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage((_.photoBase64))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                _.nombre,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                _.especialidad,
                style: TextStyle(color: Colors.teal, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Tiempo aprox.',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '60 min',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'CMP ',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _.codCMP,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12,
              ),
              child: Text(
                'Acerca del doctor',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  _.biografia,
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Precio consulta',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "S/" + _.costo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Programar Teleconsulta',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
