import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile_widget.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.category});

  final String category;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNewsArticles();
  }

  Future<void> getNewsArticles() async {
    articles = await NewsServices(Dio()).getNews(category: widget.category);
    
    // Convert/replace the second article (index 1) on the home page (general category)
    if (widget.category == 'general' && articles.length > 1) {
      articles[1] = ArticleModel(
        image: 'https://images.unsplash.com/photo-1518770660439-4636190af475',
        title: 'Breaking Tech: AI Revolutionizes Mobile Development in 2026',
        subTittle: 'Discover how artificial intelligence is transforming Flutter and native Android app creation with automated tools and advanced generative models.',
      );
    }

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            ),
          )
        : articles.isNotEmpty
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => NewsTileWidget(article: articles[index]),
                  childCount: articles.length,
                ),
              )
            : const SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: Center(child: Text('No articles found')),
                ),
              );
  }
}
