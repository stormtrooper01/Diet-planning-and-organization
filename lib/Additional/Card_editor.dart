import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardEditor extends StatefulWidget {
  CardEditor({Key? key}) : super(key: key);

  @override
  State<CardEditor> createState() => _CardEditorState();
}

class _CardEditorState extends State<CardEditor> {
  String date = DateFormat.yMMMMEEEEd().format(DateTime.now()).toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6dbc7),
      appBar: AppBar(
        title: const Text(
          'Add new record',
          style: TextStyle(fontFamily: 'Merriweather-Regular', fontSize: 24.0),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              maxLines: null,
              controller: _titleController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter title",
                filled: true,
                fillColor: const Color(0xFFbae687),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              maxLines: null,
              controller: _dataController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter content",
                filled: true,
                fillColor: const Color(0xFFbae687),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFa6c7aa)),
                ),
                onPressed: () async {
                  FirebaseFirestore.instance.collection('planner').add({
                    "title": _titleController.text,
                    "data": _dataController.text,
                    "creation_date": date,
                  }).then((value) {
                    print(value.id);
                    Navigator.pop(context);
                  }).catchError(
                      (error) => print("An error occured because of $error"));
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
