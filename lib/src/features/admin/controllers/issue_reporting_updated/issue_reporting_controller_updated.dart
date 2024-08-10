import 'package:balangoda_pulse/src/repository/issue_reporting/issue_reporting_repository_updated.dart';

import '../../../core/models/issue_reporting/issue_reporting_model.dart';

class IssueReportingControllerUpdated {
  final IssueReportingRepositoryUpdated _repositoryUpdated = IssueReportingRepositoryUpdated();

  Future<IssueReportingModel> fetchIssue(String id) {
    return _repositoryUpdated.getIssueById(id);
  }

  Future<void> markIssueAsResolved(IssueReportingModel issue) async {
    issue.additionalInfo += "\n[Resolved]";
    await _repositoryUpdated.updateIssue(issue);
  }

  Future<void> deleteIssue(String id) async {
    await _repositoryUpdated.deleteIssue(id);
  }
}
