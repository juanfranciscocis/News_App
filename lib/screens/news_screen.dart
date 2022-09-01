import 'package:flutter/material.dart';
import 'package:news_app/models/news_response_model.dart';

class NewsScreen extends StatelessWidget{
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Article? news = ModalRoute.of(context)!.settings.arguments as Article?;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(news?.title ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(news?.description ?? 'No Subtitle',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ),



                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: (news?.urlToImage != null)?DecorationImage(
                        image: NetworkImage(news!.urlToImage ?? 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png'),
                        fit: BoxFit.cover,
                      ):DecorationImage(
                        image: AssetImage('assets/no-image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(news!.content ?? 'No Content'),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}