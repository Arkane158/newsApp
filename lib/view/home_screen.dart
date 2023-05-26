import 'package:flutter/material.dart';
import 'package:news/view/category_list_screen.dart';

import 'category_grid_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const Color greyColor = Color(0xFF4F5A69);
  static const Color sportsColor = Color(0xFFC91C22);
  static const Color politicsColor = Color(0xFF003E90);
  static const Color businessColor = Color(0xFFCF7E48);
  static const Color healthColor = Color(0xFFED1E79);
  static const Color environmentColor = Color(0xFF4882CF);
  static const Color scienceColor = Color(0xFFF2D352);

  static const String screenName = "home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> category = [
    Category(
        categoryColor: HomeScreen.sportsColor,
        categoryId: 'Sports',
        categoryImageUrl: 'assets/images/sports.png',
        categoryTittle: 'Sports'),
    Category(
        categoryColor: HomeScreen.politicsColor,
        categoryId: 'General',
        categoryImageUrl: 'assets/images/Politics.png',
        categoryTittle: 'Politics'),
    Category(
        categoryColor: HomeScreen.healthColor,
        categoryId: 'Health',
        categoryImageUrl: 'assets/images/health.png',
        categoryTittle: 'Health'),
    Category(
        categoryColor: HomeScreen.businessColor,
        categoryId: 'Buisness',
        categoryImageUrl: 'assets/images/bussines.png',
        categoryTittle: 'Buisness'),
    Category(
        categoryColor: HomeScreen.environmentColor,
        categoryId: 'Environment',
        categoryImageUrl: 'assets/images/environment.png',
        categoryTittle: 'Environment'),
    Category(
        categoryColor: HomeScreen.scienceColor,
        categoryId: 'Science',
        categoryImageUrl: 'assets/images/science.png',
        categoryTittle: 'Scince'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory == null
              ? "News App"
              : selectedCategory!.categoryTittle),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Center(
                  child: Text(
                'News App!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              )),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        selectedCategory = null;
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.list,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Categories',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.black))
                        ],
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Settings',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.black))
                    ],
                  )
                ],
              ),
            )
          ],
        )),
        body: selectedCategory == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Pick your category \n of interest",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: HomeScreen.greyColor),
                      )),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: category.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 7 / 8,
                      ),
                      itemBuilder: (context, index) => CategoryGridview(
                        category: category[index],
                        index: index,
                        onClickItem: onClick,
                      ),
                    ),
                  )
                ],
              )
            : CategoryListScreen(selectedCategory!),
      ),
    );
  }

  Category? selectedCategory;

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
