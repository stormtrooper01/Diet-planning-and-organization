import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_meal_planner/Additional/Card_editor.dart';
import 'package:new_meal_planner/Additional/Planner_card.dart';
import 'package:new_meal_planner/Additional/Record_reader.dart';
import '../Additional/Recipe_card.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../main.dart';
import 'package:new_meal_planner/Screens/RecipeScreen.dart';

import 'BMIScreen.dart';
import 'MoreScreen.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6dbc7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Meal Planner Page',
          style: TextStyle(
            fontFamily: '',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              size: 30.0,
            ),
            onPressed: () {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ClassicGeneralDialogWidget(
                    titleText: 'Help',
                    contentText: 'If you have any questions or suggestions, feel free to cantact the developer via e-mail: lena.skripnik.01@gmail.com \n Copyright (c) 2022 Yelena Skrypnyk',
                    positiveText: 'Ok',
                    positiveTextStyle: TextStyle(
                      color: Colors.lightGreen[900],
                      fontSize: 20.0,
                    ),
                    onPositiveClick: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
                animationType: DialogTransitionType.slideFromTop,
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
              );
            },
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned(
                    child: Image.asset('assets/images/planner_fon2.jpg'),
                  ),
                  Positioned(
                    child: Container(
                      width: 392.0,
                      decoration: const BoxDecoration(
                          color: Color(0xFFe6dbc7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 3,
                              blurRadius: 12,
                              offset: Offset(0.0, -15.0),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              'Welcome to planner page!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 260.0,
            width: 400.0,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("planner").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: snapshot.data!.docs
                        .map((note) => plannerCard(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlannerNoteReaderScreen(note)));
                            }, note))
                        .toList(),
                  );
                }
                return Text("You have no notes in your planner yet...");
              },
            ),
          ),
          Container(
            child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFa6c7aa)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CardEditor()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 110.0,
                    ),
                    Text(
                      "Add new record",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ],
                )),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlannerScreen()));
            },
            backgroundColor: Colors.lightGreen[800],
            child: const Icon(
              Icons.wysiwyg_outlined,
              size: 35.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 55.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                width: 15.0,
              ),
              IconButton(
                  icon: const Icon(Icons.other_houses,
                      color: Colors.white, size: 35.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }),
              const SizedBox(
                width: 30.0,
              ),
              IconButton(
                  icon: const Icon(Icons.whatshot_rounded,
                      color: Colors.white, size: 35.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMIScreen()));
                  }),
              const SizedBox(
                width: 110.0,
              ),
              IconButton(
                icon:
                    const Icon(Icons.fastfood, color: Colors.white, size: 35.0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecipeScreen()));
                },
              ),
              const SizedBox(
                width: 30.0,
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz,
                    color: Colors.white, size: 35.0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoreScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
