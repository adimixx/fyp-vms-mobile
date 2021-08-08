import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms/models/complaint.dart';
import 'package:badges/badges.dart';

class ComplaintShowScreenArgs {
  final Complaint complaint;

  const ComplaintShowScreenArgs({required this.complaint});
}

class ComplaintShowScreen extends StatelessWidget {
  const ComplaintShowScreen({Key? key, required this.args}) : super(key: key);

  final ComplaintShowScreenArgs args;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    Color _primaryColor = Color.fromARGB(255, 12, 25, 70);

    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Detail'),
        backgroundColor: _primaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(color: _primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 3),
                      child: Text(
                        'Complaint Title',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      child: Text(
                        '${args.complaint.name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 3),
                      child: Text(
                        'On Vehicle',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                      child: Text(
                        '${args.complaint.vehicleInventory!.regWithName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 3),
                      child: Text(
                        'Status',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                      child: Badge(
                        shape: BadgeShape.square,
                        toAnimate: false,
                        badgeColor: args.complaint.status!.bgColor,
                        badgeContent: Text(
                          '${args.complaint.status!.name.toUpperCase()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 3),
              child: Text(
                'Complaint Description',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
              child: Text(
                '${args.complaint.detail}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 3),
              child: Text(
                'Media Attachments',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
