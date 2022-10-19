import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:new_meal_planner/Screens/RecipeScreen.dart';
import 'package:new_meal_planner/Screens/BMIScreen.dart';
import 'package:new_meal_planner/Screens/PlannerScreen.dart';
import 'package:new_meal_planner/Screens/MoreScreen.dart';

/*
Entry point of an app. Using async to fetch data from database
without interrupting execution
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

/*
Main widget of the home sceen.
Extends stateless widget, so the state won't change
 */
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //class with widgets AppBar, FloatingActionButton and BottomNavigationBar
      appBar: AppBar(
        centerTitle: true, //center alignment
        title: const Text(
          'Meal Planner & Optimiser',
          style: TextStyle(fontFamily: 'Merriweather-Regular', fontSize: 24.0), //setting style for the text
        ),
        actions: <Widget>[
          IconButton( //adding clickable icon, which acts like button
            icon: const Icon(
              Icons.info,
              size: 30.0,
            ),
            onPressed: () { //method that listens to events
              showAnimatedDialog( //animated alert dialog
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ClassicGeneralDialogWidget(
                    titleText: 'Help',
                    contentText:
                        'If you have any questions or suggestions, feel free to cantact the developer via e-mail: lena.skripnik.01@gmail.com \n Copyright (c) 2022 Yelena Skrypnyk',
                    positiveText: 'Ok', //bottom button
                    positiveTextStyle: TextStyle(
                      color: Colors.lightGreen[900],
                      fontSize: 20.0,
                    ),
                    onPositiveClick: () { //listener for the user action
                      Navigator.of(context).pop();
                    },
                  );
                },
                animationType: DialogTransitionType.slideFromTop, //specifiying animation type
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
              );
            },
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView( //widget, that makes his children scrollable
        children: [
          Column( //column alignment of children
            children: [
              Stack( //let's display one unit over another
                alignment: AlignmentDirectional.bottomCenter, //aligning bottom center
                children: [
                  Positioned( //sets the certain position
                    child: Image.asset('assets/images/fon1.jpg'),
                  ),
                  Positioned(
                    child: Container(
                      width: 400.0,
                      decoration: const BoxDecoration( //decoration for container
                          color: Color(0xFFe6dbc7),
                          boxShadow: [
                            BoxShadow(
                              //adding shadows
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              //ading circular borders
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      height: 50.0,
                      child: Column(
                        children: const [
                          SizedBox( //blank space
                            height: 12.0,
                          ),
                          Text(
                            'Hello, Friend!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Color(0xFFe6dbc7),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded( //spreads children all over the screen
                            child: Text(
                          'This app is made to help you start eating healty and grow new habits. it helps you to calculate your BMI - Body Mass Index and choose eating plan just for your needs. Also, it helps to find new recipies and plan meals! \n Here you can see most important components of your diet:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Merriweather-Regular',
                          ),
                        )),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row( //row alignment
                      children: [
                        const SizedBox(
                          width: 30.0,
                        ),
                        Column(
                          children: [
                            GestureDetector( //listener for user's tap, presented by image
                              child: Image.asset(
                                'assets/images/carbs.png',
                                width: 75.0,
                              ),
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return ClassicGeneralDialogWidget(
                                      titleText: 'What are carbohydrates?',
                                      contentText:
                                          'Carbohydrates — fiber, starches and sugars — are essential food nutrients that your body turns into glucose to give you the energy to function. Complex carbs in fruits, vegetables and whole-grain products are less likely to spike blood sugar than simple carbs (sugars). Low-carb diets like keto can be high in fats.',
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
                                  animationType:
                                      DialogTransitionType.slideFromTop,
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(seconds: 1),
                                );
                              },
                            ),
                            const Text(
                              'Carbs',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset( //adding image from asset folder
                                'assets/images/proteins.png',
                                width: 60.0,
                              ),
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return ClassicGeneralDialogWidget(
                                      titleText: 'What are proteins?',
                                      contentText:
                                          'Proteins are made up of many building blocks, known as amino acids. Our body needs dietary protein to supply amino acids for the growth and maintenance of our cells and tissues. Our dietary protein requirement changes throughout life.',
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
                                  animationType:
                                      DialogTransitionType.slideFromTop,
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(seconds: 1),
                                );
                              },
                            ),
                            const Text(
                              'Proteins',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/fats.png',
                                width: 60.0,
                              ),
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return ClassicGeneralDialogWidget(
                                      titleText: 'What are fats?',
                                      contentText:
                                          'Fats are an important part of your diet but some types are healthier than others. Choosing healthy fats from vegetable sources more often than less healthy types from animal products can help lower your risk for heart attack, stroke, and other major health problems.',
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
                                  animationType:
                                      DialogTransitionType.slideFromTop,
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(seconds: 1),
                                );
                              },
                            ),
                            const Text(
                              'Fats',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/vitamins.png',
                                width: 60.0,
                              ),
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return ClassicGeneralDialogWidget(
                                      titleText: 'What are vitamins?',
                                      contentText:
                                          'Vitamins are organic compounds that people need in small quantities. Most vitamins need to come from food because the body either does not produce them or produces very little. Having too little of any particular vitamin may increase the risk of developing certain health issues.',
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
                                  animationType:
                                      DialogTransitionType.slideFromTop,
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(seconds: 1),
                                );
                              },
                            ),
                            const Text(
                              'Vitamins',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFfb7025)),
                          overlayColor:
                              MaterialStateProperty.all(Color(0xFFf5ae07)),
                          elevation: MaterialStateProperty.all(7),
                          maximumSize:
                              MaterialStateProperty.all(const Size(184, 36)),
                        ),
                        onPressed: () {
                          showAnimatedDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return ClassicGeneralDialogWidget(
                                titleText: 'Macro and micro nutrients',
                                contentText:
                                    ' The nutrients available in food are categorized into two groups, based on how much your body needs: macronutrients and micronutrients. \n\n Macronutrients are needed in large amounts. Carbohydrates, fat, and protein are macronutrients. Micronutrients, however, are needed in smaller amounts, and these include vitamins and minerals. \n\n Macronutrients provide your body with energy. But they are also crucial for many other things, like insulating you against cold temperatures, making sure that all the cells in your body work, and feeding the microbes in your gut. ',
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
                        child: Row(
                          children: const [
                            Text(
                              'Learn more',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "Okay, now we know about components of healthy diet. \n However, we still haven't figured out what amount we need to cunsume. \n So, there are 3 main eating goals:",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "\n 1. Weight gain; \n 2. Maintanence; \n 3. Weight loss.",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "\n Go to the BMI calculator page and find out your body index to choose what aim is for you.",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "\n Great! Now let's look at meal plans and discover the best one for you!",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/Gain.jpg',
                        width: 340.0,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/Maintain.jpg',
                        width: 340.0,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/Loss.jpg',
                        width: 340.0,
                      ),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "\n Okay, awesome! \n\n Now you can go to the recipie page to find new ideas according to your meal plan. \n\n Then you can go to the planner screen, plan your dishes & track consumed meals.",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ],
          )
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIScreen()));
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
