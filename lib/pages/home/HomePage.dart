import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicianapp/controller/HomeController/HomeController.dart';
import 'package:medicianapp/pages/Doctores/DoctoresListPage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
          body: _.hayData == false && _.loading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _.hayData == false && _.loading == false
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('No hay datos')],
                    ))
                  : Container(
                      child: Column(
                        children: [
                          SafeArea(child: Container()),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: MemoryImage(_.bytes),
                                          fit: BoxFit.cover)),
                                ),
                                Text(
                                  'Telemedicina',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _.navigateToSettings();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.settings),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.search),
                                    hintText:
                                        'Encuentra la especialidad que necesitas',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*SizedBox(
              height: 20,
            ),*/
                          Expanded(
                            child: ListView.builder(
                              itemCount: _.listEspe.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _.navigateToListDoc(
                                            _.listEspe[index].idEspecialidad
                                                .toString(),
                                            _.listEspe[index].nombre);
                                      },
                                      child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: Image(
                                                    image: MemoryImage(
                                                        base64Decode(_
                                                            .listEspe[index]
                                                            .foto)),
                                                    fit: BoxFit.cover,
                                                  )),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: Text(
                                                  _.listEspe[index].nombre,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )),
    );
  }
}
