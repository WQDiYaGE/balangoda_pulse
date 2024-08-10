import 'package:balangoda_pulse/src/features/admin/controllers/community_event_controller.dart';
import 'package:balangoda_pulse/src/features/admin/screens/schedule/widgets/convert_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'widgets/event_dialog.dart';
import 'widgets/events_extracted.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final CommunityEventController communityEventController = Get.find();
  List<EventsExtracted> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    await communityEventController.fetchCommunityEvents();
    setState(() {
      events = communityEventModelsToEvents(communityEventController.communityEvents);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)
          ),
          title: const Text('Schedule'),
          backgroundColor: CustomColors.primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: EventSearchDelegate(events),
                );
              },
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.primaryColor.withOpacity(0.8),
                  CustomColors.primaryColor.withOpacity(0.6),
                ],
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(CustomSizes.medium),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16
                            ),
                            backgroundColor: CustomColors.accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            _showAddEventDialog(context);
                          },
                          child: const Text('Create New Event')
                      ),
                      const SizedBox(height: CustomSizes.spaceBetweenSubSections),
                      Expanded(
                          child: SfCalendar(
                            view: CalendarView.month,
                            headerHeight: 48.0,
                            viewHeaderHeight: -1.0,
                            todayHighlightColor: CustomColors.todayHighlightColor,
                            todayTextStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                            cellBorderColor: Colors.purple,
                            dataSource: EventDataSource(events),
                            selectionDecoration: BoxDecoration(
                                color: CustomColors.secondaryColor.withOpacity(0.5),
                                border: Border.all(color: CustomColors.secondaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            headerStyle: CalendarHeaderStyle(
                                backgroundColor: CustomColors.primaryColor.withOpacity(0.8),
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            monthViewSettings: MonthViewSettings(
                              showAgenda: true,
                              monthCellStyle: MonthCellStyle(
                                  backgroundColor: CustomColors.accentColor.withOpacity(0.3),
                                  todayBackgroundColor: CustomColors.accentColor.withOpacity(0.9),
                                  trailingDatesBackgroundColor: CustomColors.primaryColor.withOpacity(0.3),
                                  leadingDatesBackgroundColor: CustomColors.primaryColor.withOpacity(0.2),
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                  ),
                                  trailingDatesTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400
                                  ),
                                  leadingDatesTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                              agendaStyle: const AgendaStyle(
                                  appointmentTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                  dayTextStyle: TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 16
                                  ),
                                  dateTextStyle: TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  backgroundColor: Colors.white70
                              ),
                            ),
                            onTap: (CalendarTapDetails details) {
                              if (details.appointments != null && details.appointments!.isNotEmpty) {
                                final EventsExtracted event = details.appointments!.first;
                                _showEditEventDialog(context, event);
                              }
                            },
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EventDialog(
          onSave: (event) {
            setState(() {
              events.add(event);
            });
          },
        );
      },
    );
  }

  void _showEditEventDialog(BuildContext context, EventsExtracted event) {
    showDialog(
      context: context,
      builder: (context) {
        return EventDialog(
          event: event,
          onSave: (editedEvent) {
            setState(() {
              int index = events.indexOf(event);
              events[index] = editedEvent;
            });
          },
        );
      },
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventsExtracted> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].date;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].date.add(const Duration(hours: 1));
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  String getNotes(int index) {
    return appointments![index].description;
  }

  @override
  Color getColor(int index) {
    return CustomColors.primaryColor;
  }
}

class EventSearchDelegate extends SearchDelegate {
  final List<EventsExtracted> events;

  EventSearchDelegate(this.events);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = events.where((event) => event.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final event = results[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Text('${event.date.toLocal()}'.split(' ')[0]),
          onTap: () {
            close(context, event);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = events.where((event) => event.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final event = suggestions[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Text('${event.date.toLocal()}'.split(' ')[0]),
          onTap: () {
            query = event.title;
            showResults(context);
          },
        );
      },
    );
  }
}
