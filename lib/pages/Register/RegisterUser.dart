import 'package:flutter/material.dart';
import 'package:medicianapp/controller/RegisterController/RegisterController.dart';
import 'package:get/get.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_)=> Scaffold(
        //appBar: AppBar(),
        body: Column(
          children: [
            SafeArea(child: Container()),
            Text(
              'Registrate',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]
              ),
            ),
            SizedBox(height: 8,),
            Text(
              'Crea tu nueva cuenta',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237 , 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.nameController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nombre',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.apePaController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Apellido paterno',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.apeMaController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Apellido materno',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.dniController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Numero de documento de identidad',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Correo electrónico',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(225, 230, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.userController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nombre de usuario',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(227, 232, 237, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _.passController,
                    style: TextStyle(
                      color: Colors.blue[900]
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(
                        color: Colors.blue[900]
                      ),
                      icon: Icon(Icons.ac_unit,color: Colors.blue[900],)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Spacer(),

            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: GestureDetector(
                onTap: (){
                  _.registerUser();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      'Registrarme',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,)
            
            
          ],
        ),
        
      ),
    );
  }
}