import 'package:balangoda_pulse/src/features/admin/controllers/issue_reporting_updated/issue_reporting_controller_updated.dart';
import 'package:balangoda_pulse/src/features/admin/screens/issue_reporting/widgets/issue_reporting_detail_screen.dart';
import 'package:balangoda_pulse/src/features/core/models/issue_reporting/issue_reporting_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class IssueReportingManagementInterface extends StatelessWidget {
  const IssueReportingManagementInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final IssueReportingControllerUpdated _controller = IssueReportingControllerUpdated();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)
          ),
          title: const Text('Issue Reporting Management Interface'),
          backgroundColor: CustomColors.primaryColor
      ),
      body: FutureBuilder(
        future: firestore.collection('issueReports').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No issues reported.'));
          }
          final issues = snapshot.data!.docs;
          return ListView.builder(
            itemCount: issues.length,
            itemBuilder: (context, index) {
              final issue = issues[index];
              final dateOfIssue = issue['dateOfIssue'] != null
                  ? (issue['dateOfIssue'] as Timestamp).toDate().toLocal().toString().split(' ')[0]
                  : 'Date not specified';
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    issue['description'],
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Contact: ${issue['contact']}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Location: ${issue['location'] ?? 'Not specified'}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Date of Issue: $dateOfIssue',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () async {
                      // Mark as resolved logic (optional)
                      final issueSnapshot = await firestore.collection('issueReports').doc(issue.id).get();
                      if (issueSnapshot.exists) {
                        final issueData = IssueReportingModel.fromSnapshot(issueSnapshot);
                        await _controller.markIssueAsResolved(issueData);
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IssueReportingDetailScreen(issueId: issue.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
