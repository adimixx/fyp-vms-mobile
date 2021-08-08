import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Status extends Equatable {
  const Status(
      {required this.sequence,
      required this.name,
      this.colorClass,
      this.frontVisible = false});

  final int sequence;
  final String name;
  final String? colorClass;
  final bool frontVisible;

  Color get bgColor {
    switch (this.colorClass) {
      case "primary":
        return Color.fromARGB(255, 12, 25, 70);
      case "info":
        return Color.fromARGB(255, 108, 178, 235);
      case "secondary":
        return Color.fromARGB(255, 108, 117, 125);
      case "success":
        return Color.fromARGB(255, 25, 135, 84);
      case "danger":
        return Color.fromARGB(255, 220, 53, 69);
      case "warning":
        return Color.fromARGB(255, 255, 193, 7);
      case "light":
        return Color.fromARGB(255, 248, 249, 250);
      case "dark":
        return Color.fromARGB(255, 33, 37, 41);
      default:
        return Colors.black;
    }
  }

  @override
  List<Object> get props => [sequence, name, frontVisible];

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      sequence: json['sequence'],
      name: json['name'],
      colorClass: json['color_class'],
      frontVisible: (json['front_visible'] == 1) ? true : false,
    );
  }
}
