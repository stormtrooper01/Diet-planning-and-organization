import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget recipeCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
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
                doc["name"],
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
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
                'assets/images/timer.png',
                height: 40.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                doc["duration"],
                style: TextStyle(
                  fontSize: 23.0,
                ),
                overflow: TextOverflow.ellipsis,
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
                doc["category"],
                style: TextStyle(
                  fontSize: 23.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
