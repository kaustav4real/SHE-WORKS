import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:intl/intl.dart';

class FloatingBtn extends StatefulWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  State<FloatingBtn> createState() => _FloatingBtnState();
}

class _FloatingBtnState extends State<FloatingBtn> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xff039BE5),
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTweet()));
        });
  }
}

class CreateTweet extends ConsumerStatefulWidget {
  const CreateTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetState();
}

class _CreateTweetState extends ConsumerState<CreateTweet> {
  final tweetTextController = TextEditingController();
  final CollectionReference tweetsCollection =
  FirebaseFirestore.instance.collection('feed');
  String? uploadedFileUrl;
  //final x=DateFormat('dd-MM-yyyy').format(DateTime.now());
  void shareTweet() {
    final tweet = {
      'isVerified': true,
      'content': tweetTextController.text,
      'owner': 'Annie Bryant',
      'date': DateTime.now(),
      'filename':
      uploadedFileUrl != null ? uploadedFileUrl!.split('/').last : null,
      'userName': '@nirvana26',
      'url': uploadedFileUrl,
      'dpurl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTOpcKSjWNv37qjuGhlNiXoXJU5HmCUtPhgivKXXUg&s',
    };
    tweetsCollection.add(tweet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Your Feelings'),
        backgroundColor:
        const Color.fromARGB(255, 66, 176, 183).withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              FilePickerResult? result =
              await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null) {
                PlatformFile file = result.files.first;
                String fileName = file.name;
                String filePath = file.path!;
                try {
                  await firebase_storage.FirebaseStorage.instance
                      .ref('uploads/$fileName')
                      .putFile(File(filePath));
                  String downloadURL = await firebase_storage
                      .FirebaseStorage.instance
                      .ref('uploads/$fileName')
                      .getDownloadURL();
                  setState(() {
                    uploadedFileUrl = downloadURL;
                  });
                } catch (e) {
                  print(e);
                }
              }
            },
            icon: Icon(
              Icons.image,
              size: 30,
            ),
            padding: EdgeInsets.only(top: 0.2, right: 0.3),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          shareTweet();
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/SwagatGogoi110/job/main/assets/images/avatar.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: tweetTextController,
                      decoration: const InputDecoration(
                        hintText: 'What\'s happening?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  uploadedFileUrl == null
                      ? const Text('No image selected')
                      : Flexible(
                    child: Image.network(
                      uploadedFileUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
