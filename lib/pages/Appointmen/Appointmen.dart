import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medicianapp/controller/AppointmentController/AppointController.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmenPage extends StatelessWidget {
  const AppointmenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApointController>(
      init: ApointController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Agendar cita'),
        ),
        body: Container(
          child: Column(
            children: [
              //Text('Los horarios que se muestran a continuación son para los dias de Lunes a Domingo'),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  child: TableCalendar(
                    shouldFillViewport: true,
                    firstDay: DateTime(2021),
                    lastDay: DateTime(2050),
                    focusedDay: _.focusday, //DateTime.now(),
                    weekendDays: [DateTime.saturday, DateTime.sunday],
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarFormat: CalendarFormat.month,
                    calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white)),
                    onDaySelected: (DateTime selectday, DateTime focusDay) {
                      _.selectedDay(selectday, focusDay);
                      //print(focusDay);
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(_.selectDay, date);
                    },
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),

              /*Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: double.infinity,
                    //color: Colors.black,
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      calendarStyle: CalendarStyle(),
                    )),
              ),*/
              Expanded(
                  child: Container(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 3 / 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 4),
                          itemCount: _.listHorarios.length,
                          itemBuilder: (context, index) {
                            return Container(
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text(_.listHorarios[index].descripcion),
                                ));
                          })

                      /*ListView.builder(
                    itemCount: _.listHorarios.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                //height: 50,
                                //width: 50,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text(_.listHorarios[index].descripcion),
                                )),
                          ),
                        ],
                      );
                    }),*/

                      )),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Programar horario',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
