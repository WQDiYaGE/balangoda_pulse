import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/core/models/issue_reporting/issue_reporting_model.dart';

class IssueReportingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to add an issue to Firestore
  Future<void> addIssue(IssueReportingModel issue) async {
    try {
      await _firestore.collection('issueReports').add(issue.toJson());
    } catch (e) {
      throw Exception('Error adding issue to Firestore: $e');
    }
  }

  // Method to update an issue in Firestore
  Future<void> updateIssue(String issueId, Map<String, dynamic> updates) async {
    try {
      await _firestore.collection('issueReports').doc(issueId).update(updates);
    } catch (e) {
      throw Exception('Error updating issue in Firestore: $e');
    }
  }

  // Method to delete an issue from Firestore
  Future<void> deleteIssue(String issueId) async {
    try {
      await _firestore.collection('issueReports').doc(issueId).delete();
    } catch (e) {
      throw Exception('Error deleting issue from Firestore: $e');
    }
  }

  // Method to fetch all issues from Firestore
  Future<List<IssueReportingModel>> fetchIssues() async {
    try {
      final querySnapshot = await _firestore.collection('issueReports').get();
      return querySnapshot.docs
          .map((doc) => IssueReportingModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching issues from Firestore: $e');
    }
  }
}
