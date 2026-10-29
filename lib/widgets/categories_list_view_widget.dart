import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'Business', img: 'assets/images/business.avif'),
    CategoryModel(
      categoryName: 'Entertainment',
      img: 'assets/images/entertaiment.avif',
    ),
    CategoryModel(categoryName: 'General', img: 'assets/images/general.avif'),
    CategoryModel(categoryName: 'Health', img: 'assets/images/health.avif'),
    CategoryModel(categoryName: 'Science', img: 'assets/images/science.avif'),
    CategoryModel(categoryName: 'Sports', img: 'assets/images/sports.avif'),
    CategoryModel(
      categoryName: 'Technology',
      img: 'assets/images/technology.jpeg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              CategoryCardWidget(category: categories[index]),
        ),
      ),
    );
  }
}
