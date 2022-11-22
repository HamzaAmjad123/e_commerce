

import 'dart:convert';

import 'package:e_commerce/service/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/user_model.dart';

class Methods{
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    DateTime dates = DateTime.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  String getDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    DateTime dates = DateTime.parse(date);
    return "${DateFormat.yMMMd().format(dates)}"+" ${DateFormat.jm().format(dates)}";
    // "   ${DateFormat.jm().format()}";
  }
    incrementDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date+5);
    DateTime dates = DateTime.parse(date);
    int day=dates.day;
    String month = DateFormat('MMMM').format(dates);
    print(day);
    print(month);

    // "   ${DateFormat.jm().format()}";
  }
  String getTime({String separator = ":"}) {
    int day = 0;
    int year = 0;
    String seperator = ', ';
    DateTime now = DateTime.now();
    day = now.day + 5;
    year = now.year;
    String month = DateFormat('MMMM').format(now);
    return month + " " + day.toString();
  }

  // Future<bool?> popDialog() async {
  //   return await showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) => Padding(
  //         padding:
  //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10)),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(mainAxisSize: MainAxisSize.min, children: [
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Text(
  //                 'Do you want to close your application?',
  //                 style:
  //                 TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
  //               ),
  //               Divider(),
  //               Row(
  //                 children: [
  //                   TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text('No')),
  //                   Spacer(),
  //                   TextButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop(true);
  //                       },
  //                       child: Text('Yes')),
  //                 ],
  //               )
  //             ]),
  //           ),
  //         ),
  //       ));
  // }

}

getUser()async{
  String getUser=await LocalStorageServices().getUser();
  return UserResponseModel.fromJson(jsonDecode(getUser));
}

getUserId()async{
  String getUser=await LocalStorageServices().getUser();
  UserResponseModel user= UserResponseModel.fromJson(jsonDecode(getUser));
   int id=user.user!.tenantId!;
   return id;
}