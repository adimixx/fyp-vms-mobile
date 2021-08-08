import 'package:equatable/equatable.dart';

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
