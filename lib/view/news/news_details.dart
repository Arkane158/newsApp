import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/api/models/article/article.dart';

class NewsDetails extends StatelessWidget {
  static const String screenName = 'newsDetails';
  final Article article;
  const NewsDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.title ?? '',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text('Author: ${article.author}'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  article.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(article.publishedAt ?? ''),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SingleChildScrollView(
                  child: Text(
                    article.description ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 18),
                  ),
                ),
              )
              // Text(article.source.toString())
            ],
          ),
        ),
      ),
    );
  }
}
