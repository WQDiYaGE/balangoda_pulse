import 'package:balangoda_pulse/src/features/core/screens/calendar/widgets/meeting.dart';
import 'package:balangoda_pulse/src/features/core/screens/calendar/widgets/meeting_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';

class SfCalandarScreen extends StatefulWidget {
  const SfCalandarScreen({super.key});

  @override
  State<SfCalandarScreen> createState() => _SfCalandarScreenState();
}

class _SfCalandarScreenState extends State<SfCalandarScreen> {
  MeetingDataSource? events;
  final fireStoreReference = FirebaseFirestore.instance;
  final List<Color> _colorCollection = <Color>[];
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    _initializeEventColor();
    _getDataFromFireStore();
  }

  void _initializeEventColor() {
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
  }

  Future<void> _getDataFromFireStore() async {
    var snapShotsValue = await fireStoreReference
        .collection("CalendarAppointmentCollection")
        .get();

    final Random random = Random();
    List<Meeting> list = snapShotsValue.docs
        .map((e) {
          final data = e.data();
          final dateTime = (data['dateTime'] as Timestamp).toDate();
          final eventName = data['name'] as String?;
          final color = _colorCollection[random.nextInt(_colorCollection.length)];

          print('Fetched event: $eventName, dateTime: $dateTime');

          return Meeting(
            eventName: eventName,
            from: dateTime,
            to: dateTime,
            background: color,
            isAllDay: false,
            key: e.id
          );
        }).toList();

        print('Total events created: ${list.length}');
        setState(() {
          events = MeetingDataSource(list);
        });
  }

  void _goToPreviousMonth() {
    _calendarController.backward!();
  }

  void _goToNextMonth() {
    _calendarController.forward!();
  }

  void _goToToday() {
    _calendarController.displayDate = DateTime.now();
  }

  void _onViewChanged(CalendarView view) {
    setState(() {
      _calendarController.view = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Calendar'),
        backgroundColor: CustomColors.primaryColor2.withOpacity(0.9),
        actions: [
          IconButton(
              onPressed: _goToPreviousMonth,
              icon: const Icon(Icons.arrow_back_ios_outlined)
          ),
          IconButton(
              onPressed: _goToToday,
              icon: const Icon(Icons.today)
          ),
          IconButton(
              onPressed: _goToNextMonth,
              icon: const Icon(Icons.arrow_forward_ios_outlined)
          ),
          _buildViewSwitcher()
        ]
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCalendar(
              controller: _calendarController,
              dataSource: events,
              todayHighlightColor: CustomColors.todayHighlightColor,
              cellBorderColor: Colors.purple,
              selectionDecoration: BoxDecoration(
                color: CustomColors.selectionColor.withOpacity(0.5),
                border: Border.all(color: CustomColors.selectionColor, width: 2.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              headerStyle: CalendarHeaderStyle(
                backgroundColor: CustomColors.calendarHeaderColor.withOpacity(0.8),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              monthViewSettings: MonthViewSettings(
                showAgenda: true,
                monthCellStyle: MonthCellStyle(
                  backgroundColor: CustomColors.todayBackgroundColor.withOpacity(0.3),
                  todayBackgroundColor: CustomColors.todayBackgroundColor.withOpacity(0.9),
                  trailingDatesBackgroundColor: CustomColors.trailingAndLeadingBackgroundColor.withOpacity(0.3),
                  leadingDatesBackgroundColor: CustomColors.trailingAndLeadingBackgroundColor.withOpacity(0.2),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  trailingDatesTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  leadingDatesTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                agendaStyle: const AgendaStyle(
                  appointmentTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  dayTextStyle: TextStyle(
                    color: CustomColors.dayAndDateTextColor,
                    fontSize: 16,
                  ),
                  dateTextStyle: TextStyle(
                    color: CustomColors.dayAndDateTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white70,
                ),
              ),
              onTap: (CalendarTapDetails details) {
                if (details.appointments != null && details.appointments!.isNotEmpty) {
                  final Meeting event = details.appointments!.first;
                  _showEventDetailsDialog(context, event);
                }
              },
            ),
          ),
          Container(
            height: 200,
            child: _buildEventList(),
          )
        ],
      ),
    );
  }

  Widget _buildViewSwitcher() {
    return DropdownButton<CalendarView>(
      value: _calendarController.view,
      icon: Icon(Icons.view_agenda, color: Colors.white),
      dropdownColor: CustomColors.primaryColor2,
      underline: SizedBox(),
      items: CalendarView.values.map((CalendarView view) {
        return DropdownMenuItem<CalendarView>(
          value: view,
          child: Text(
            view.toString().split('.').last,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (CalendarView? newView) {
        if (newView != null) {
          _onViewChanged(newView);
        }
      },
    );
  }

  Widget _buildEventList() {
    if (events == null || events!.appointments!.isEmpty) {
      return Center(child: Text('No upcoming events', style: TextStyle(color: Colors.white)));
    }

    return ListView.builder(
      itemCount: events!.appointments?.length,
      itemBuilder: (context, index) {
        final Meeting event = events!.appointments?[index];
        return ListTile(
          title: Text(event.eventName ?? 'No Title', style: TextStyle(color: Colors.white)),
          subtitle: Text(
            'From: ${DateFormat('dd/MM/yyyy HH:mm').format(event.from!)}\n'
                'To: ${DateFormat('dd/MM/yyyy HH:mm').format(event.to!)}',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () => _showEventDetailsDialog(context, event),
        );
      },
    );
  }

  void _showEventDetailsDialog(BuildContext context, Meeting event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(event.eventName ?? 'No Title'),
          content: Text(
            'From: ${DateFormat('dd/MM/yyyy HH:mm').format(event.from!)}\n'
                'To: ${DateFormat('dd/MM/yyyy HH:mm').format(event.to!)}',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
