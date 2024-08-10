import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/local_news_model.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/local_news_detail_screen.dart';


class UserLocalNewsStatus extends StatelessWidget {
  final LocalNewsModel news;

  const UserLocalNewsStatus({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {

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
              Text(
                news.headline,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
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
