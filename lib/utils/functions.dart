

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Methods{
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    DateTime dates = DateTime.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
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
