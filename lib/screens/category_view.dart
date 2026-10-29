import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.category,
    required this.categoryDisplayName,
  });

  final String category;
  final String categoryDisplayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryDisplayName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          NewsListView(category: category),
        ],
      ),
    );
  }
}
