import 'package:balangoda_pulse/src/features/admin/screens/issue_reporting/issue_reporting_management_interface.dart';
import 'package:balangoda_pulse/src/features/admin/screens/service_management_interface/service_management_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/content_management_interface.dart';
import 'package:balangoda_pulse/src/features/admin/screens/dashboard_overview/dashboard.dart';
import 'package:balangoda_pulse/src/features/admin/screens/schedule/schedule.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';

import '../../authentication/screens/login_screen/login_screen.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    ServiceManagementScreen(),
    const ContentManagementInterface(),
    const IssueReportingManagementInterface(),
    const Schedule()
  ];

  void _onItemTapped(int index) {
    if (index >= 0 && index < _widgetOptions.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
              ),
              child: Text(
                'Admin Panel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Service Management Interface'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Content Management Interface'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Issue Reporting Management Interface'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Schedule'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushAndRemoveUntil(
                    (context),
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text(_getTitle(_selectedIndex)),
      //   backgroundColor: CustomColors.primaryColor,
      //   foregroundColor: CustomColors.white,
      // ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }

  // String _getTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'Dashboard Overview';
  //     case 1:
  //       return 'Content Management Interface';
  //     case 2:
  //       return 'Schedule';
  //     case 3:
  //       return 'Notifications';
  //     case 4:
  //       return 'Settings';
  //     default:
  //       return 'Admin Panel';
  //   }
  // }
}
