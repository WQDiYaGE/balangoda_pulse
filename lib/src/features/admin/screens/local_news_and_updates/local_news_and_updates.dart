import 'package:balangoda_pulse/src/features/admin/screens/local_news_and_updates/widgets/article.dart';
import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:get/get.dart';

class LocalNewsAndUpdates extends StatefulWidget {
  const LocalNewsAndUpdates({super.key});

  @override
  State<LocalNewsAndUpdates> createState() => _LocalNewsUpdatesState();
}

class _LocalNewsUpdatesState extends State<LocalNewsAndUpdates> {
  List<Article> articles = [
    Article('Announcement', 'Community Center Opening', 'Details about the community center opening.'),
    Article('Event', 'Charity Run', 'Details about the charity run.'),
    Article('Local News', 'New Park', 'Details about the new park.'),
  ];

  // void _addArticle(Article article) {
  //   setState(() {
  //     articles.add(article);
  //   });
  // }

  // void _editArticle(Article oldArticle, Article newArticle) {
  //   setState(() {
  //     int index = articles.indexOf(oldArticle);
  //     articles[index] = newArticle;
  //   });
  // }

  // void _deleteArticle(int index) {
  //   setState(() {
  //     articles.removeAt(index);
  //   });
  // }

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
        title: const Text('Local News & Updates'),
        backgroundColor: CustomColors.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: delegate)
              },
              icon: const Icon(Icons.search)
          )
        ]
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildExpandablePanel(
            context,
            title: 'Announcements',
            icon: Icons.announcement,
            color: Colors.orange, screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Community Events',
            icon: Icons.event,
            color: Colors.green,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Local News',
            icon: Icons.article,
            color: Colors.blue,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Public Notices',
            icon: Icons.public,
            color: Colors.brown,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Emergency Alerts',
            icon: Icons.warning,
            color: Colors.red,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Development Projects',
            icon: Icons.construction,
            color: Colors.purple,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Cultural & Lifestyle',
            icon: Icons.palette,
            color: Colors.teal,
            screen: null
          ),
          _buildExpandablePanel(
            context,
            title: 'Community Spotlights',
            icon: Icons.highlight,
            color: Colors.pink,
            screen: null
          ),
        ],
      ),

      // Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         CustomColors.primaryColor.withOpacity(0.8),
      //         CustomColors.primaryColor.withOpacity(0.6)
      //       ],
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(CustomSizes.medium),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: CustomColors.accentColor,
      //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10.0)
      //             )
      //           ),
      //           onPressed: () {
      //             _showAddArticleDialog(context);
      //           },
      //           child: const Text('Create New Article'),
      //         ),
      //         const SizedBox(height: CustomSizes.spaceBetweenSubSections),
      //         Expanded(
      //           child: ListView.builder(
      //             itemCount: articles.length,
      //             itemBuilder: (context, index) {
      //               final article = articles[index];
      //               return Card(
      //                 elevation: 4,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                 ),
      //                 child: ListTile(
      //                   leading: const Icon(
      //                       Icons.article,
      //                       color: CustomColors.primaryColor
      //                   ),
      //                   title: Text(article.title),
      //                   subtitle: Text(article.category),
      //                   trailing: Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: <Widget>[
      //                       IconButton(
      //                         icon: const Icon(Icons.edit),
      //                         onPressed: () {
      //                           _showEditArticleDialog(context, article);
      //                         },
      //                       ),
      //                       IconButton(
      //                         icon: const Icon(Icons.delete),
      //                         onPressed: () {
      //                           _deleteArticle(index);
      //                         },
      //                       ),
      //                     ],
      //                   ),
      //                   onTap: () {
      //                     // Handle article tap, e.g., navigate to article details
      //                   },
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // )
    );
  }

  // void _showAddArticleDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return ArticleDialog(
  //         onSave: (article) {
  //           _addArticle(article);
  //         },
  //       );
  //     },
  //   );
  // }

  // void _showEditArticleDialog(BuildContext context, Article article) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return ArticleDialog(
  //         article: article,
  //         onSave: (editedArticle) {
  //           _editArticle(article, editedArticle);
  //         },
  //       );
  //     },
  //   );
  // }

  Widget _buildExpandablePanel(BuildContext context, {required String title, required IconData icon, required Color color, required Widget? screen}) {
    return Card(
      child: ExpansionTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(color: color)),
        children: <Widget>[
          ListTile(
            title: Text('Manage $title'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Get.to(() => screen),
          ),
        ],
      ),
    );
  }
}
