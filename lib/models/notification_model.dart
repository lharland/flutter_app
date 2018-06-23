import 'package:flutter/material.dart';
class NotificationModel {
  final String icon;
  final String title;
  final String descn;

  NotificationModel({this.icon, this.title, this.descn});
}

List<NotificationModel> dummyData = [
  new NotificationModel(
      title: "Promotion",
      descn: r"Save $5",
      icon: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
         
  new NotificationModel(
      title: "Promotion",
      descn: r"Unlimited 0.9",
      icon: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
         

];
