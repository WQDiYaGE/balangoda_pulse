import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/local_news_controller.dart';
import '../../../../models/local_news_model.dart';
import '../../local_news/local_news_form_screen.dart';
import 'details_screens/local_news_detail_screen.dart';

class LocalNewsStatus extends StatelessWidget {
  final LocalNewsModel news;

  const LocalNewsStatus({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    final LocalNewsController controller = Get.put(LocalNewsController());

    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      news.headline,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocalNewsFormScreen(localNews: news),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          await controller.deleteLocalNews(news.id!);
                        },
                        icon: const Icon(Icons.delete_outlined),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                news.publicationDate.toLocal().toString().split(' ')[0],
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: CustomSizes.small),
              Text(
                news.summary,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              if (news.embeddedArticle.isNotEmpty)
                Text(
                  news.embeddedArticle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocalNewsDetailScreen(news: news),
          ),
        );
      },
    );
  }
}
