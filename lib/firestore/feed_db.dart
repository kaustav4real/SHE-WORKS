import 'package:flutter/material.dart';
import 'package:hackVita/widgets/popup.dart';
import '../global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayFeed extends StatefulWidget {
  const DisplayFeed({Key? key}) : super(key: key);

  @override
  State<DisplayFeed> createState() => _DisplayFeedState();
}

class _DisplayFeedState extends State<DisplayFeed> {
  CollectionReference userFeed = FirebaseFirestore.instance.collection('feed');

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
                              fit: BoxFit.cover,
                              image: NetworkImage(data['dpurl']))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(children: [
                                    Text(
                                      data['owner'],
                                      style: feedOwner,
                                    ),
                                    const SizedBox(width: 3),
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
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    data['userName'],
                                    style:
                                    const TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              data['userName'] == "@nirvana26"
                                  ? GestureDetector(
                                child: const Icon(Icons.keyboard_control_sharp),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 40,
                                          color: Colors.transparent,
                                          child: TextButton(
                                              onPressed: () {
                                                final collectionToDelete=document.id;
                                                userFeed.doc(collectionToDelete).delete().then((value)=>print('User Deleted'));
                                                Navigator.of(context).pop();

                                              },
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: const <
                                                    Widget>[
                                                  Text('Delete', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.delete, size: 18,)
                                                ],
                                              )),
                                        );
                                      });
                                },
                              )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            data['content'],
                            maxLines: 30,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: tweetContentStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (data['url'] != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Popup(
                                        imageUrl: data['url'] as String),
                                  ),
                                );
                              }
                            },
                            child: data['url'] != null
                                ? Image.network(
                              data['url'] as String,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}