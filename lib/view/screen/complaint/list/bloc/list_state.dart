part of 'list_bloc.dart';

class ListState extends Equatable {
  const ListState._(
      {this.isLoading = false,
      this.complaintList,
      this.errorMessage,
      this.complaintStats = const ComplaintStats()});

  const ListState.empty() : this._();
  const ListState.listLoading() : this._(isLoading: true);
  const ListState.listLoaded(
      List<Complaint> complaintList, ComplaintStats complaintStats)
      : this._(
            isLoading: false,
            complaintList: complaintList,
            complaintStats: complaintStats);
  const ListState.exception({required String message})
      : this._(isLoading: false, errorMessage: message);

  final List<Complaint>? complaintList;
  final ComplaintStats complaintStats;
  final bool isLoading;

  final String? errorMessage;

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.complaintList,
        this.isLoading,
        this.errorMessage,
        this.complaintStats
      ];
}
