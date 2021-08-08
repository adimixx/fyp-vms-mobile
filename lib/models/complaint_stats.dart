import 'package:equatable/equatable.dart';

class ComplaintStats extends Equatable {
  const ComplaintStats({this.pending = 0, this.processed = 0});

  final int pending;
  final int processed;

  @override
  List<Object> get props => [pending, processed];

  static const empty = ComplaintStats();

  factory ComplaintStats.fromJson(Map<String, dynamic> json) {
    return ComplaintStats(
        pending: json['pending'], processed: json['processed']);
  }
}
