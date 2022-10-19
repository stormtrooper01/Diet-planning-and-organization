import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlannerNoteReaderScreen extends StatefulWidget {
  PlannerNoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<PlannerNoteReaderScreen> createState() => _PlannerNoteReaderScreen();
}

class _PlannerNoteReaderScreen extends State<PlannerNoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6dbc7),
      appBar: AppBar(
        title: const Text(
          'Detailed info about record',
          style: TextStyle(fontFamily: 'Merriweather-Regular', fontSize: 24.0),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["title"],
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              widget.doc["data"],
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: TextStyle(
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
