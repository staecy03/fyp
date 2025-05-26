import 'package:cloud_firestore/cloud_firestore.dart';

class Plan {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final Timestamp timestamp;

  Plan({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.timestamp,
  });
}

/*class Plan {
  int? id;
  String? title;
  String? district;
  int? isCompleted;
  String? location;
  String? activity;
  String? date;
  String? startTime;
  String? endTime;
  int? remind;
  int? colour;
  String? userId;

  Plan({
    this.id,
    this.title,
    this.district,
    this.isCompleted,
    this.location,
    this.activity,
    this.date,
    this.startTime,
    this.endTime,
    this.remind,
    this.colour,  
    this.userId, required description, required completed, required timeStamp,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      title: json['title'],
      district: json['district'],
      isCompleted: json['isCompleted'],
      location: json['location'],
      activity: json['activity'], // Corrected typo
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      remind: json['remind'],
      colour: json['colour'], 
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'district': district,
      'isCompleted': isCompleted,
      'location': location,
      'activity': activity,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
      'colour': colour,
      'userId': userId,
    };
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class Plan {
  int? id;
  String? title;
  String? district;
  int? isCompleted;
  String? location;
  String? activity;
  String? date;
  String? startTime;
  String? endTime;
  int? colour;
}

// ignore: non_constant_identifier_names
/*Plan({
  this.id,
  this.title,
  this.district,
  this.isCompleted,
  this.location,
  this.activity,
  this.date,
  this.startTime,
  this.endTime,
  this.colour
}) */

dynamic plan({
   dynamic id,
   dynamic title,
   dynamic district,
   dynamic isCompleted,
   dynamic  location,
   dynamic  activity,
   dynamic date,
   dynamic startTime,
   dynamic endTime,
   dynamic colour
}) 

// ignore: unused_local_variable, non_constant_identifier_names
Plan{ required TextEditingController title;}fromJson(Map<String, dynamic> json) {
  id = json['id'];
  title = json['title'];
  district = json['district'];
  isCompleted = json['isCompleted'];
  location = json['location'];
  activity = json['acctivity'];
  date = json['date'];
  startTime = json['startTime'];
  endTime = json['endTime'];
  colour = json['colour'];
}

Map<String, dynamic> toJson(required) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] =  this.id;
  data['title'] = this.title;
  data['district'] = this.district;
  data['isCompleted'] = this.isCompleted;
  data['location'] = this.location;
  data['activity'] = this.activity;
  data['date'] = this.date;
  data['startTime'] = this.startTime;
  data['endTime'] = this.endTime;
  data['colour'] = this.colour;
  return data;
}*/
