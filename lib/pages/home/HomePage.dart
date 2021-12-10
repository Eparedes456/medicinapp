import 'package:flutter/material.dart';
import 'package:medicianapp/controller/HomeController/HomeController.dart';
import 'package:medicianapp/pages/Doctores/DoctoresListPage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget category() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => DoctoresListPage(),
            ),
          );
        },
        child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Medicina General',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            )),
      );
    }

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_)=> Scaffold(
          body: Container(
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
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    'Telemedicina',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.people_alt),
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
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Encuentra la especialidad que necesitas',
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
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _.navigateToListDoc(_.listEspe[index].idEspecialidad.toString(),_.listEspe[index].nombre);
                        },
                        child: Card(
                          elevation: 5,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
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
                          )
                        ),
                      ),
                      SizedBox(height: 12,)
                    ],
                  );
                },
              )
                 
              ,
            )
          ],
        ),
      )),
    );
  }
}
