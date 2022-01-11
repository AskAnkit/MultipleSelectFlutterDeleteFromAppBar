

import 'package:flutter/material.dart';
import 'package:respayc/common_widgets/app_text.dart';
import 'package:respayc/utils/app_colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController = ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String>
  listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //To Show Current Date
          Container(
              height: 30,
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                selectedDate.day.toString() +
                    '-' +
                    listOfMonths[selectedDate.month - 1] +
                    ', ' +
                    selectedDate.year.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo[700]),
              )),
          SizedBox(height: 10),
          //To show Calendar Widget
          Container(

              child: Container(
                  child: Expanded(
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10);
                      },
                      itemCount: 12,
                      controller: scrollController,

                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentDateSelectedIndex = index;
                              selectedDate =
                                  DateTime.now().add(Duration(days: index));
                            });
                          },
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(3, 3),
                                      blurRadius: 5)
                                ],
                                color: currentDateSelectedIndex == index
                                    ? AppColor.themeColor
                                    : Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  listOfMonths[DateTime.now()
                                      .add(Duration(days: index))
                                      .month -
                                      1]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: currentDateSelectedIndex == index
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                                Text(
                                  listOfMonths[DateTime.now()
                                      .add(Duration(days: index))
                                      .month -
                                      1]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: currentDateSelectedIndex == index
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  DateTime.now()
                                      .add(Duration(days: index))
                                      .day
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: currentDateSelectedIndex == index
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  listOfDays[DateTime.now()
                                      .add(Duration(days: index))
                                      .weekday -
                                      1]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: currentDateSelectedIndex == index
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))),
        ],
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:respayc/common_widgets/custom_appbar.dart';
// import 'package:respayc/utils/reusable.dart';
//
// class CalendarPage extends StatefulWidget {
//   const CalendarPage({Key? key}) : super(key: key);
//
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }
//
// class _CalendarPageState extends State<CalendarPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: CustomAppBar(
//       title: "Calender",
//     ),
//
//     body: ListView.builder(
//       itemCount: 12,
//
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           margin:const EdgeInsets.all(20.0),
//
//           decoration: BoxDecoration(
//               boxShadow: [ BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 10.0
//
//               ),]
//           ),
//           child: Card(
//
//
//             elevation: 7,
//             child: CalendarDatePicker(
//
//             onDateChanged: (DateTime value) {  },
//     initialDate: DateTime.now(),
//     lastDate: DateTime(2023,1,1),
//     firstDate: DateTime.now(),
//
//             ),
//           ),
//         );
//
//     },
//       )
//     );
//   }
// }
//
//
//
