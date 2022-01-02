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

              Expanded(
                  child: Container(
                      child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 3 / 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 4),
                    itemCount: _.listHorarios.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _.selectHour(_.listHorarios[index]);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: _.listHorarios[index].select == false
                                    ? Colors.transparent
                                    : Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                  child: Text(
                                _.listHorarios[index].descripcion,
                                style: TextStyle(
                                    color: _.listHorarios[index].select == true
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            )),
                      );
                    }),
              ))),
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
                    GestureDetector(
                      onTap: () {
                        _.saveAppointment();
                      },
                      child: Container(
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
                      ),
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
