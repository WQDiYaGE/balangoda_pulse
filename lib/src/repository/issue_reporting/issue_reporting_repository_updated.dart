import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/core/models/issue_reporting/issue_reporting_model.dart';

class IssueReportingRepositoryUpdated {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<IssueReportingModel> getIssueById(String id) async {
    final snapshot = await _firestore.collection('issueReports').doc(id).get();
    if (snapshot.exists) {
      return IssueReportingModel.fromSnapshot(snapshot);
    } else {
      throw Exception('Issue not found');
    }
  }

  Future<void> updateIssue(IssueReportingModel issue) async {
    await _firestore.collection('issueReports').doc(issue.id).update(issue.toJson());
  }

  Future<void> deleteIssue(String id) async {
    await _firestore.collection('issueReports').doc(id).delete();
  }
}
