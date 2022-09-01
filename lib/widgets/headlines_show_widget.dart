

import 'package:flutter/material.dart';

import '../models/news_response_model.dart';


class HeadlinesShowWidget extends StatelessWidget {

  final List<Article> news;

  const HeadlinesShowWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 15,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(news[index].title ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),

                  Container(
                    width: double.infinity,
                    height: 200,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/giphy.gif'),
                      image: NetworkImage(news[index].urlToImage ?? 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(news[index].description ?? ''),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}