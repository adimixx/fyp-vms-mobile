part of 'complaint_create_bloc.dart';

abstract class ComplaintCreateEvent extends Equatable {
  const ComplaintCreateEvent();

  @override
  List<Object> get props => [];
}

class ComplaintFromQR extends ComplaintCreateEvent {
  const ComplaintFromQR({required this.qrResult});

  final String qrResult;

  @override
  List<Object> get props => [qrResult];
}
