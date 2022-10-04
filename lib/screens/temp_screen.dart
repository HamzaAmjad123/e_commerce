// import 'dart:io';
//
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
//
// Future<void> main() async {
//   final pdf = pw.Document();
//
//   pdf.addPage(MultiPage(
//       build: (context) => [
//         Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('INVOICE',
//                   style: TextStyle(
//                       fontSize: 24, fontWeight: FontWeight.bold)),
//               Column(children: [
//                 Text("user.name",
//                     style: TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.bold)),
//                 Text("user.email", style: const TextStyle(fontSize: 14))
//               ])
//             ]),
//
//       ]));
//
//   final file = File('example.pdf');
//   await file.writeAsBytes(await pdf.save());
//
//
