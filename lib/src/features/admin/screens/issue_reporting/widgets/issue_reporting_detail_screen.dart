import 'package:balangoda_pulse/src/features/admin/controllers/issue_reporting_updated/issue_reporting_controller_updated.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/issue_reporting/issue_reporting_model.dart';

class IssueReportingDetailScreen extends StatefulWidget {
  final String issueId;

  const IssueReportingDetailScreen({super.key, required this.issueId});

  @override
  State<IssueReportingDetailScreen> createState() => _IssueReportingDetailScreenState();
}

class _IssueReportingDetailScreenState extends State<IssueReportingDetailScreen> {
  final IssueReportingControllerUpdated _controllerUpdated = IssueReportingControllerUpdated();
  late Future<IssueReportingModel> _issue;

  @override
  void initState() {
    super.initState();
    _issue = _controllerUpdated.fetchIssue(widget.issueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<IssueReportingModel>(
        future: _issue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Issue not found.'));
          } else {
            final issue = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Issue Details',
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                side: const BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                shadowColor: Colors.black26,
                                elevation: 3.0,
                              ),
                              child: const Text(
                                'CLOSE',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.info, 'Type', issue.issueType),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.description, 'Description', issue.description),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.contact_phone, 'Contact', issue.contact),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.location_on, 'Location', issue.location ?? 'Not specified'),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.calendar_today, 'Date of Issue', issue.dateOfIssue?.toLocal().toString().split(' ')[0] ?? 'Not specified'),
                        const SizedBox(height: 8),
                        _buildDetailRow(context, Icons.info_outline, 'Additional Info', issue.additionalInfo),
                        const SizedBox(height: 20),
                        if (issue.imageUrls != null && issue.imageUrls!.isNotEmpty)
                          _buildImagesSection(context, issue.imageUrls!),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _controllerUpdated.markIssueAsResolved(issue);
                                setState(() {
                                  _issue = _controllerUpdated.fetchIssue(widget.issueId);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Mark as Resolved'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await _controllerUpdated.deleteIssue(widget.issueId);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Delete Issue'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: $value',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesSection(BuildContext context, List<String> imageUrls) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Images:',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
