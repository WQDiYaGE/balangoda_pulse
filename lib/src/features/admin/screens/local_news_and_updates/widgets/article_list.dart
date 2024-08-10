import 'package:flutter/material.dart';

import 'article.dart';
import 'article_list_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.onEdit,
    required this.onDelete,
  });

  final List<Article> articles;
  final Function(Article, Article) onEdit;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleListItem(
          article: articles[index],
          onEdit: (editedArticle) => onEdit(articles[index], editedArticle),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}