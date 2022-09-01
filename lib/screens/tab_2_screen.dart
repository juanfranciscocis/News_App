import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/models/category_model.dart';
import 'package:provider/provider.dart';

import '../models/news_response_model.dart';
import '../services/news_service.dart';
import '../widgets/headlines_show_widget.dart';

class Tab2Screen extends StatefulWidget{
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    //newsService.getNewsByCategory(newsService.categoryElection.toString());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(height: 60,),
          Container(
              width: double.infinity,
              height: 75,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _Categories(),
              )
          ),

          //SizedBox(height: 60,),
          Flexible(child: HeadlinesShowWidget(news: newsService.byCategory)),
        ],
      ),
      //_CategorieScroll(newsService: newsService),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




class _Categories extends StatelessWidget {
  const _Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () async {
              String category = categories[index].name.toString();
              final newsService = Provider.of<NewsService>(context, listen: false);
              newsService.categoryElection = categories[index].name;
              var articles = await newsService.getNewsByCategory(category);
              (articles.length == 0)? newsService.byCategory = [Article(title: 'No news for this category', description: 'Nothing to show')]: null;
            },
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(categories[index].icon, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(categories[index].name.toUpperCase()),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
