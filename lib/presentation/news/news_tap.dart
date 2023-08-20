import 'package:flutter/material.dart';
import 'package:news/domain/models/sources_response/source.dart';
import 'package:news/presentation/news/di.dart';
import 'package:news/presentation/news/news_list.dart';
import 'package:news/presentation/news/news_source_item.dart';
import 'package:news/presentation/news/news_viewmodel.dart';

class NewsTab extends StatefulWidget {
  final List<Source> sources;

  const NewsTab({Key? key, required this.sources}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  NewsViewModel viewModel = NewsViewModel(injectNewsUsecase());
  int selectedIndex = 0;
  Key newsListKey = UniqueKey(); // Add a key for NewsList

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    newsListKey = UniqueKey(); // Update the key
                  });
                },
                tabs: widget.sources
                    .map((source) => NewsSourceItme(
                          source: source,
                          isSelected:
                              widget.sources.indexOf(source) == selectedIndex,
                        ))
                    .toList(),
                isScrollable: true,
                indicatorColor: Colors.transparent,
              ),
              if (widget.sources.isNotEmpty)
                Expanded(
                    child: NewsList(
                        key: newsListKey,
                        source: widget.sources[selectedIndex]))
            ],
          )),
    );
  }
}
