import 'package:flutter/material.dart';
class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    Key? key,
    required this.category,
    required this.index,
    required this.onClickItem,
  }) : super(key: key);

  final Category category;
  final int index;
  final Function onClickItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClickItem(category),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.categoryColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(category.categoryImageUrl)),
            Text(
              category.categoryTittle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}


class Category {
  Category(
      {required this.categoryColor,
      required this.categoryId,
      required this.categoryImageUrl,
      required this.categoryTittle});
  String categoryTittle;
  String categoryImageUrl;
  Color categoryColor;
  String categoryId;
}
