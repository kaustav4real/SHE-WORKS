import 'package:flutter/material.dart';
import '../global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayNews extends StatefulWidget {
  const DisplayNews({Key? key}) : super(key: key);

  @override
  State<DisplayNews> createState() => _DisplayNewsState();
}

class _DisplayNewsState extends State<DisplayNews> {
  final Stream<QuerySnapshot> _newsStream =
  FirebaseFirestore.instance.collection('news').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _newsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
            document.data()! as Map<String, dynamic>;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(data['imgURL']),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data['tags'],
                                style: newsTag,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                data['title'],
                                style: newsHeader,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 3,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    data['date'],
                                    style: newDataStyle,
                                  ),
                                  Text(
                                    '${data['readTime']} mins',
                                    style: newDataStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            );
          }).toList(),
        );
      },
    );
  }
}