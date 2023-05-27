import 'package:flutter/material.dart';
import 'package:news/core/api/models/sources_response/source.dart';

class NewsSourceItme extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const NewsSourceItme(
      {super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
