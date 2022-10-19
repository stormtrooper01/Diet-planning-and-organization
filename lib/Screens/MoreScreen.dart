import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:new_meal_planner/Screens/RecipeScreen.dart';
import 'package:new_meal_planner/Screens/BMIScreen.dart';
import 'package:new_meal_planner/Screens/PlannerScreen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfef6e1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'More Page',
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
        padding: const EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xfff68443)),
                    elevation: MaterialStateProperty.all(7),
                    minimumSize:
                    MaterialStateProperty.all(const Size(384, 100)),
                  ),
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'How to contact?',
                          contentText: 'You can contact the developer in case you have any troubles, qyestions, suggestions or complains via e-mail: lena.skripnik.01@gmail.com',
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
                    children: [
                      Image.asset(
                        'assets/images/question.png',
                        height: 55.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'How to contact?',
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xfff68443)),
                    elevation: MaterialStateProperty.all(7),
                    minimumSize:
                    MaterialStateProperty.all(const Size(384, 100)),
                  ),
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Why do I need to know my BMI?',
                          contentText: 'Your BMI is a measurement that is a ratio of your weight and height. It’s a good way to gauge whether your weight is in healthy proportion to your height. In fact, knowing your BMI can help you – and your GP – determine any health risks you may face if it’s outside of the healthy range.\n Being overweight can lead to a range of chronic conditions including:\n Type 2 Diabetes\n High blood pressure\n Cardiovascular disease\n\n Being underweight can result in other health issues like:\n Risk of malnutrition\n Osteoporosis\n Anaemia',
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
                    children: [
                      SizedBox(
                        width: 2.0,
                      ),
                      Image.asset(
                        'assets/images/calculator.png',
                        height: 50.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ' Why do I need to know \n my BMI?',
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xfff68443)),
                    elevation: MaterialStateProperty.all(7),
                    minimumSize:
                    MaterialStateProperty.all(const Size(384, 100)),
                  ),
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Why do I need to eat healthy?',
                          contentText: ' It protects you against many chronic noncommunicable diseases, such as heart disease, diabetes and cancer. Eating a variety of foods and consuming less salt, sugars and saturated and industrially-produced trans-fats, are essential for healthy diet.\n\n A healthy diet comprises a combination of different foods. \n\nThese include:\nStaples like cereals (wheat, barley, rye, maize or rice) or starchy tubers or roots (potato, yam, taro or cassava).\nLegumes (lentils and beans).\nFruit and vegetables.\nFoods from animal sources (meat, fish, eggs and milk).',
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
                    children: [
                      Image.asset(
                        'assets/images/eat1.png',
                        height: 57.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        ' Why do I need to eat \n healthy?',
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xfff68443)),
                    elevation: MaterialStateProperty.all(7),
                    minimumSize:
                    MaterialStateProperty.all(const Size(384, 100)),
                  ),
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Do my weight or my parameters matter?',
                          contentText: 'Maintaining a healthy weight is important for health. In addition to lowering the risk of heart disease, stroke, diabetes, and high blood pressure, it can also lower the risk of many different cancers.\n\n Move more, eat less. Turning off the television and skipping the sugary drinks are two ways to get started.\nYour weight, your waist size, and the amount of weight gained since your mid-20s can have serious health implications. These factors can strongly influence your chances of developing the following diseases and conditions',
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
                    children: [
                      Image.asset(
                        'assets/images/weight.png',
                        height: 55.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ' Do my weight or my \n parameters matter?',
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xfff68443)),
                    elevation: MaterialStateProperty.all(7),
                    minimumSize:
                    MaterialStateProperty.all(const Size(384, 100)),
                  ),
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Does healthy eating mean restrictions?',
                          contentText: 'Absolutely not!\n\nAlthough certain people need — or choose — to avoid particular foods or adopt diets for health reasons, most people don’t have to follow any specific diet to feel their best.\nThat’s not to say that certain eating patterns can’t benefit you.\n\nFor instance, some people feel healthiest when following a low carb diet, while others thrive on high carb diets.\nIn general, though, eating healthy has nothing to do with adhering to diets or certain dietary rules. “Healthy eating” simply means prioritizing your wellness by fueling your body with nutritious foods.\n\nThe specifics may be different for each person depending on their location, financial situation, culture and society, and taste preferences.',
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
                    children: [
                      Image.asset(
                        'assets/images/no.png',
                        height: 55.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        ' Does healthy eating mean \n restrictions?',
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  )
              ),
            ],
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