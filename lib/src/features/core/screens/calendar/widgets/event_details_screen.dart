// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../calendar_screen.dart';
//
// class EventDetailsScreen extends StatelessWidget {
//   final Meeting event;
//
//   const EventDetailsScreen({super.key, required this.event});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(event.eventName)),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Date: ${event.from.toLocal()}'.split(' ')[0]),
//             Text('Time: ${event.from.hour}:${event.from.minute}'),
//             Text('Location: Event Location'), // Replace with actual location if available
//             const SizedBox(height: 16.0),
//             const Text('Description: Event Description'), // Replace with actual description
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle RSVP/Join
//               },
//               child: const Text('RSVP/Join'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle Add to Personal Calendar
//               },
//               child: const Text('Add to Personal Calendar'),
//             ),
//             const SizedBox(height: 16.0),
//             Container(
//               height: 200,
//               child: GoogleMap(
//                 initialCameraPosition: const CameraPosition(
//                   target: LatLng(37.7749, -122.4194), // Replace with actual coordinates
//                   zoom: 14,
//                 ),
//                 markers: {
//                   Marker(
//                     markerId: const MarkerId('eventLocation'),
//                     position: const LatLng(37.7749, -122.4194), // Replace with actual coordinates
//                   ),
//                 },
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Leave a comment...',
//                 border: OutlineInputBorder(),
//               ),
//               onSubmitted: (value) {
//                 // Handle comment submission
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
