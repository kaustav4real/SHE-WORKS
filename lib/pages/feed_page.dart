import 'package:flutter/material.dart';
import '../global_variables.dart';
import '../firestore/feed_db.dart';
class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget> [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const <Widget> [
              Text('Your Feed', style:FeedHeader,),
              SizedBox(height: 10,),
              DisplayFeed()
            ],
          ),
        ),
      ],
    );
  }
}