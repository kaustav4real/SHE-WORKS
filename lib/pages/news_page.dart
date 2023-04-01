import 'package:flutter/material.dart';
import '../global_variables.dart';
import '../firestore/news.dart';
import '../widgets/imageCarousel.dart';
class NewsWidget extends StatefulWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          const SizedBox(height: 10,),
          const ImageCarousel(),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const<Widget> [
                SizedBox(height: 30,),
                SizedBox(height: 30),
                Text('Latest News', style: globalHeading,),
                SizedBox(height: 20),
                DisplayNews(),
              ],
            ),
          )]
    );
  }
}