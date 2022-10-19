import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:new_meal_planner/Screens/RecipeScreen.dart';
import 'package:new_meal_planner/Screens/BMIScreen.dart';
import 'package:new_meal_planner/Screens/PlannerScreen.dart';

import 'MoreScreen.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int currentIndex = 0;
  late String result = '';
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfef6e1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Page',
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
          Container(
            child: Image.asset('assets/images/choice.jpg'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              radioButton("Man", Colors.lightGreen, 0),
              radioButton("Woman", Colors.lightGreen, 1)
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Enter your height in cm:',
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: heightController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Your height in cm",
              filled: true,
              fillColor: const Color(0xFFbae687),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Enter your weight in kg:',
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: weightController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Your weight in kg",
              filled: true,
              fillColor: const Color(0xFFbae687),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
              overlayColor: MaterialStateProperty.all(Colors.lightGreen),
              elevation: MaterialStateProperty.all(7),
            ),
            onPressed: () {
              double height = double.parse(heightController.value.text);
              double weight = double.parse(weightController.value.text);
              calculateBMI(height, weight);
            },
            child: Text(
              'Calculate my BMI',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Text(
              'Your BMI is:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: Text(
              "$result",
              textAlign: TextAlign.center,
              style: TextStyle(
                background: Paint()
                  ..color = Colors.lightGreen
                  ..strokeWidth = 30
                  ..style = PaintingStyle.stroke,
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Row(
              children: const [
                SizedBox(
                  width: 40.0,
                ),
                Text(
                  'Learn more about BMI',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ],
            ),
            onPressed: () {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ClassicGeneralDialogWidget(
                    titleText: 'Why The Number Is Important',
                    positiveText: 'OK',
                    positiveTextStyle: TextStyle(
                      color: Colors.lightGreen[900],
                      fontSize: 20.0,
                    ),
                    contentText: "A body mass index in the low range signals that you could be malnourished. Maybe your body isn’t properly absorbing nutrients or maybe you’re just not getting enough calories to support your activity level. Conversely, having a BMI on the higher end alerts your physician that your risks of heart disease, diabetes and certain cancers are higher than someone with a normal BMI. Your doctor might set you up with a registered dietitian, who can help you get your weight back on track and reduce your risk of developing health problems.",
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
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.lightGreen[900]),
              overlayColor: MaterialStateProperty.all(Colors.lightGreen),
              elevation: MaterialStateProperty.all(7),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "Let's have a look at what your result means:",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "< 18.5 - Underweight. You should definitely eat more.",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "18.5 - 24.9 - Normal weight. Congratulations! You should maintain your weight.",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "25 - 29.9 - Overweight. You have to eat less, so your meal plan has to be for weight loss.",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "30 - 39.9 - Obesity. Eat less and include some exercise to lose weight.",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        "> 40 - Extreme obesity. You should see a doctor.",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            height: 360.0,
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
          ),
          Image.asset('assets/images/plate.jpg'),
          SizedBox(
            height: 12.0,
          ),
          Text(
            '\n You have to remember that healthy eating is NOT about calculating calories and restricting yourself. It is all about eating what you want in correct proportions and at the right time. Do not force yourself and enjoy eating! \n \n You can find interesting meals at the recipe page and schedule them at planner page.',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 22.0,
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

  void calculateBMI(double height, double weight) {
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 90.0,
        child: FlatButton(
          color: currentIndex == index ? color : Color(0xFFffe9bd),
          onPressed: () {
            changeIndex(index);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 27.0,
                color: currentIndex == index ? Colors.black54 : color),
          ),
        ),
      ),
    );
  }
}
