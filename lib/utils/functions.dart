

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

  String invoiceDate(var abc) {
    var cdate=abc;
    String month=cdate.toString().substring(0,2);
    String date=cdate.toString().substring(3,5);
    String year=cdate.toString().substring(6,10);
    var temp="$year-$month-$date";
    print("temppp $temp");

    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(temp);
    DateTime dates = DateTime.parse(temp);
    return "${DateFormat.yMMMd().format(dates)}";
    // "   ${DateFormat.jm().format()}";
  }
    incrementDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date+5);
    DateTime dates = DateTime.parse(date);
    int day=dates.day;
    String month = DateFormat('MMMM').format(dates);
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
}
showImageDialog({required BuildContext context,required String url}){
  return showDialog(context: context, builder: (context){
    return Dialog(
      child: url.isEmpty?Image.asset("assets/image/placeholder.png"):Image.network(url,fit: BoxFit.fill,),
    );
  });
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