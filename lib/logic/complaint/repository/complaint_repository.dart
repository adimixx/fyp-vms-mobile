import 'dart:async';
import 'dart:convert';

import 'package:network_repository/network_repository.dart';
import 'package:vms/models/complaint.dart';
import 'package:vms/models/complaint_stats.dart';
import 'package:vms/models/user.dart';

class ComplaintRepository {
  Future<List<Complaint>> getComplaintList() async {
    final response = await NetworkRepository().getData(apiUrl: '/complaint');

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw Exception('Server Error');
    }

    final _bodyDecode = json.decode(response.body) as List;

    final List<Complaint> _complaintList =
        _bodyDecode.map((e) => Complaint.fromJson(e)).toList();

    return _complaintList;
  }

  Future<ComplaintStats> getComplaintStats() async {
    final res = await NetworkRepository().getData(apiUrl: '/complaint/stats');

    if (res.statusCode < 200 || res.statusCode > 300) {
      throw Exception('Server Error');
    }

    final _complaintStats = ComplaintStats.fromJson(jsonDecode(res.body));

    return _complaintStats;
  }

  Future<List<Complaint>> getComplaint({required int id}) async {
    final response =
        await NetworkRepository().getData(apiUrl: '/complaint/$id');

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw Exception('Server Error');
    }

    final _bodyDecode = json.decode(response.body) as List;

    final List<Complaint> _complaintList =
        _bodyDecode.map((e) => Complaint.fromJson(e)).toList();

    return _complaintList;
  }

  Future<bool> postComplaint() async {
    // TODO: Implement data for POST
    final response =
        await NetworkRepository().postData(apiUrl: '/complaint', data: null);

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw Exception('Server Error');
      return false;
    }

    return true;
  }
}
