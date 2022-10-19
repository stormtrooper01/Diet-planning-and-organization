import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeReaderScreen extends StatefulWidget {
  RecipeReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<RecipeReaderScreen> createState() => _RecipeReaderScreen();
}

class _RecipeReaderScreen extends State<RecipeReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6dbc7),
      appBar: AppBar(
        title: const Text(
          'Detailed info about recipe',
          style: TextStyle(fontFamily: 'Merriweather-Regular', fontSize: 24.0),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/dish.png',
                  height: 40.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  widget.doc["name"],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/timer.png',
                  height: 37.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  widget.doc["duration"],
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/flag.png',
                  height: 37.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  widget.doc["category"],
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                SizedBox(width: 10.0),
                Container(
                  height: 55.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    widget.doc["kcal"],
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  height: 55.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    widget.doc["carbs"],
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  height: 55.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    widget.doc["fats"],
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  height: 55.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    widget.doc["proteins"],
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Description:',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightGreen[900],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              widget.doc["description"],
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Ingredients:',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightGreen[900],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Image.asset(
                  'assets/images/tick.png',
                  height: 37.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.doc["ing1"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/tick.png',
                  height: 37.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.doc["ing2"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/tick.png',
                  height: 37.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.doc["ing3"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/tick.png',
                  height: 37.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.doc["ing4"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Additionally:',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightGreen[900],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Image.asset(
                  'assets/images/add.png',
                  height: 35.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.doc["add-ing"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Instructions:',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightGreen[900],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.doc["instructions"],
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
