part of 'list_bloc.dart';

class ListState extends Equatable {
  const ListState._(
      {this.isLoading = false,
      this.complaintList,
      this.complaintListTile,
      this.errorMessage});

  const ListState.empty() : this._();
  const ListState.listLoading() : this._(isLoading: true);
  const ListState.listLoaded(
      List<Complaint> complaintList, List<Widget> complaintListTile)
      : this._(
            isLoading: false,
            complaintList: complaintList,
            complaintListTile: complaintListTile);
  const ListState.exception({required String message})
      : this._(isLoading: false, errorMessage: message);

  final List<Complaint>? complaintList;
  final List<Widget>? complaintListTile;
  final bool isLoading;

  final String? errorMessage;

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.complaintList,
        this.complaintListTile,
        this.isLoading,
        this.errorMessage
      ];
}
