import 'package:flutter/material.dart';
import '../global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayFeed extends StatefulWidget {
  const DisplayFeed({Key? key}) : super(key: key);

  @override
  State<DisplayFeed> createState() => _DisplayFeedState();
}

class _DisplayFeedState extends State<DisplayFeed> {
  final Stream<QuerySnapshot> _feedStream =
  FirebaseFirestore.instance.collection('feed').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _feedStream,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image(
                            fit: BoxFit.cover, image: NetworkImage(data['url'])),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(children: [
                                Text(
                                  data['owner'],
                                  style: feedOwner,
                                ),
                                const SizedBox(width:3),
                                data['isVerified']
                                    ? const Icon(
                                  Icons.verified_outlined,
                                  size: 18,
                                  color: Colors.blue,
                                )
                                    : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                              ]),
                              const SizedBox(width: 10,),
                              Text(data['userName'], style: const TextStyle(
                                  color: Colors.blueGrey
                              ),)
                            ],
                          ),
                          Text(
                            data['content'],
                            maxLines: 30,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          }).toList(),
        );
      },
    );
  }
}