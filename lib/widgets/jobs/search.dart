import 'package:flutter/material.dart';
import 'package:hackVita/models/job.dart';
import 'package:hackVita/pages/jobs_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchAppBar(),
              SearchInput(),
              SearchOption(),
              Expanded(child: SearchList()),
            ],
          )
        ],
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  final joblist = Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: ListView.separated(
          itemBuilder: (context, index) => JobItem(
                joblist[index],
                showTime: true,
              ),
          separatorBuilder: (_, index) => SizedBox(height: 20),
          itemCount: joblist.length),
    );
  }
}

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, right: 10),
                transform: Matrix4.rotationZ(100),
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        )),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.more_horiz_outlined),
            ],
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/icons/search.png',
                        width: 20,
                      ),
                    )),
              )),
          SizedBox(width: 10),
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset('assets/icons/filter.png'),
          ),
        ],
      ),
    );
  }
}

class SearchOption extends StatefulWidget {
  const SearchOption({Key? key}) : super(key: key);

  @override
  State<SearchOption> createState() => _SearchOptionState();
}

class _SearchOptionState extends State<SearchOption> {
  final optionMap = <String, bool>{
    'Development': true,
    'Business': false,
    'Data': false,
    'Design': false,
    'Operation': false,
  };
  @override
  Widget build(BuildContext context) {
    var keys = optionMap.keys.toList();
    return Container(
      height: 25,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 25),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                var res = optionMap[keys[index]] ?? false;
                optionMap[keys[index]] = !res;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: optionMap[keys[index]] != null &&
                      optionMap[keys[index]] == true
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  )),
              child: Row(
                children: [
                  Text(
                    keys[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: optionMap[keys[index]] != null &&
                          optionMap[keys[index]] == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if (optionMap[keys[index]] != null &&
                      optionMap[keys[index]] == true)
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.close,
                          size: 15,
                          color: Colors.white,
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
          separatorBuilder: (_, index) => SizedBox(width: 10),
          itemCount: optionMap.length),
    );
  }
}
