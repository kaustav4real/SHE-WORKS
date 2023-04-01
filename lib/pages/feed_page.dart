import 'package:flutter/material.dart';
import '../firestore/feed_db.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child:const Image(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTOpcKSjWNv37qjuGhlNiXoXJU5HmCUtPhgivKXXUg&s',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            const Text('Your Feed', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
        const SizedBox(height: 4,),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 10,
              ),
              MyAppBar(),
              SizedBox(
                height: 10,
              ),
              DisplayFeed()
            ],
          ),
        ),
      ],
    );
  }
}