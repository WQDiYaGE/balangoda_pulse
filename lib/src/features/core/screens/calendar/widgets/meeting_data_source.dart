import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'meeting.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from!;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to!;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay!;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName!;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background!;
  }
}