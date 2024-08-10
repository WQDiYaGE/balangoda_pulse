import 'package:flutter/material.dart';

import 'article.dart';
import 'article_dialog.dart';


class ArticleListItem extends StatelessWidget {
  final Article article;
  final Function(Article) onEdit;
  final VoidCallback onDelete;

  const ArticleListItem({
    super.key,
    required this.article,
    required this.onEdit,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.category),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _showEditArticleDialog(context, article);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  void _showEditArticleDialog(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) {
        return ArticleDialog(
          article: article,
          onSave: onEdit,
        );
      },
    );
  }
}