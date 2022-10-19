import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget plannerCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.lightGreen, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["title"],
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            doc["data"],
            style: TextStyle(
              fontSize: 20.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            doc["creation_date"],
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    ),
  );
}
