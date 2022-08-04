import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  @override
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  @override
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(
      color: Color(0xff30384c),
      fontWeight: fontWeight,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        weekdayStyle: dayStyle(FontWeight.normal),
        weekendStyle: dayStyle(FontWeight.normal),
        selectedColor: Color(0xff30374b),
        todayColor: Color(0xff30374b),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Color(0xff30374b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        weekendStyle: TextStyle(
          color: Color(0xff30374b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          color: Color(0xff30384c),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Color(0xff30384c),
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Color(0xff30384c),
        ),
      ),
      calendarController: _controller,
    );
  }
}
