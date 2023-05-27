import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/api/models/article/article.dart';

class NewsBodyItem extends StatelessWidget {
  final Article article;
  const NewsBodyItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text("Tittle:  ${article.title ?? ''}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 8,
          ),
          Text("Author:  ${article.author ?? ''}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Published At:  ${article.publishedAt ?? ''}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
