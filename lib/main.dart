//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackVita/firebase_options.dart';
import 'package:hackVita/global_variables.dart';
import 'package:hackVita/pages/feed_page.dart';
import 'package:hackVita/pages/jobs_page.dart';
import 'package:hackVita/pages/news.dart';
import 'package:hackVita/pages/send_tweet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tweetPage = false;
  bool setTweetPage = false;
  int selectedIndex = 0;

  static const List<Widget> items = <Widget>[NewsPage(), JobPage(), FeedPage()];
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: items[selectedIndex]),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: navBackgroundColor,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.article,
                    size: bottomNavIconSize,
                  ),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: bottomNavIconSize,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dynamic_feed,
                    size: bottomNavIconSize,
                  ),
                  label: 'Feed',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: const Color(0xff039BE5),
              unselectedItemColor: const Color(0xFF90A4AE),
              selectedFontSize: 10,
              unselectedFontSize: 10,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
              onTap: onItemTapped,
            ),
            floatingActionButton: selectedIndex == 2
                ? const FloatingBtn()
                : const SizedBox(
              height: 0,
              width: 0,
            )),
        ),
      );
  }
}
