import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Mis citas'),
              ),
              Divider(),
              ListTile(
                title: Text('Cerrar Sesion'),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
