import 'package:flutter/material.dart';
import 'package:news/core/api/models/sources_response/source.dart';
import 'package:news/view/news/news_list.dart';
import 'package:news/view/news/news_source_item.dart';

class NewsTab extends StatefulWidget {
  final List<Source> sources;

  const NewsTab({Key? key, required this.sources}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

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
                Expanded(child: NewsList(source: widget.sources[selectedIndex]))
            ],
          )),
    );
  }
}
