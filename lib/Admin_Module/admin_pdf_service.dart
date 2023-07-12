import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import 'package:open_file/open_file.dart';

import '../model/admin_models/admin_ledger_model.dart';
import '../provider/home_dashboard_provider.dart';

class CustomRow {
  final String date;
  final String debit;
  final String credit;
  final String discription;

  CustomRow(this.date, this.debit, this.credit, this.discription);
}

class AdminPdfInvoiceService {
  final box = GetStorage();
  UserModel? usermodels;


  AdminPdfInvoiceService() {
    usermodels = UserModel.fromJson(box.read('user'));
  }

  Future<Uint8List> createInvoice(List<AdminLedgerList>? ledgerDetails,String? fromDate, String? toDate,BuildContext ctx) async {
    final pdf = pw.Document();

    final List<CustomRow> elements = [
      for (int i = 0; i < ledgerDetails!.length; i++)
        CustomRow(
           "",
            getValue(ledgerDetails[i].totalAmount ?? 0.0),
            getValue(ledgerDetails[i].totalReceived ?? 0.0),
            "",
        )
    ];
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
                padding: pw.EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                height: 50,
                color: PdfColor.fromInt(0xF5F5F5),
                child: pw.Text("Dealer Name :" + "  " + usermodels!.name!,
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromInt(0x000000),
                    ))),
            pw.Container(
                padding: pw.EdgeInsets.only(top: 10, left: 30, bottom: 10),
                width: double.infinity,
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("CashBook Record",
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromInt(0x000000),
                          )),
                      // pw.Row(
                      //   mainAxisAlignment: pw.MainAxisAlignment.start,
                      //   children: [
                      //     pw.Text(Methods().invoiceDate(fromDate),
                      //         style: pw.TextStyle(
                      //           fontSize: 12,
                      //           fontWeight: pw.FontWeight.normal,
                      //           color: PdfColor.fromInt(0x000000),
                      //         )),
                      //     pw.SizedBox(width: 5),
                      //     pw.Text("To",
                      //         style: pw.TextStyle(
                      //           fontSize: 12,
                      //           fontWeight: pw.FontWeight.normal,
                      //           color: PdfColor.fromInt(0x000000),
                      //         )),
                      //     pw.SizedBox(width: 5),
                      //     pw.Text(Methods().invoiceDate(toDate),
                      //         style: pw.TextStyle(
                      //           fontSize: 12,
                      //           fontWeight: pw.FontWeight.normal,
                      //           color: PdfColor.fromInt(0x000000),
                      //         )),
                      //   ],
                      // ),
                    ])),
            pw.Container(
                padding: pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 60,
                color: PdfColor.fromInt(0xF5F5F5),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Total In\(\+\)",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                            pw.Text(
                                // Provider.of<HomeDashboardProvider>(ctx,listen: false).dashboard!.revenueData!.totalAmount.toString(),
                                "5864562576",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                          ]),
                      pw.Container(
                        width: 1,
                        height: 40,
                        color: PdfColor.fromInt(0x000000),
                      ),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Total Out\(\-\)",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                            pw.Text(
                              "88888",
                                // Provider.of<HomeDashboardProvider>(ctx,listen: false).dashboard!.revenueData!.totalPaid.toString(),
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                          ]),
                      pw.Container(
                        width: 1,
                        height: 40,
                        color: PdfColor.fromInt(0x000000),
                      ),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Total Balance",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                            pw.Text(
                                // Provider.of<HomeDashboardProvider>(ctx,listen: false).dashboard!.revenueData!.totalRemaining.toString(),
                              "334343",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0xFF87ab69),
                                )),
                            pw.Text("Munafa",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColor.fromInt(0xFF87ab69),
                                )),
                          ]),
                    ])),
            pw.Container(
                width: double.infinity,
                padding: pw.EdgeInsets.symmetric(vertical: 10),
                decoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xFFFFFF),
                ),
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Date",
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                            pw.Text("Cash In\(\+\)",
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                            pw.Text("Cash Out\(\-\)",
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0x000000),
                                )),
                          ]),
                      pw.Container(
                        width: double.infinity,
                        height: 1,
                        color: PdfColor.fromInt(0xF5F5F5),
                      ),
                    ])),
            itemColumn(elements),
            pw.SizedBox(height: 25),
            pw.Text("Thanks for your trust, and till the next time."),
            pw.SizedBox(height: 25),
            pw.Text("Kind regards,"),
          ];
        },
      ),
    );
    return pdf.save();
  }

  itemColumn(List<CustomRow> elements) {
    return pw.Column(
      children: [
        for (var element in elements)
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      element.date,
                    ),
                    pw.Text(element.debit, textAlign: pw.TextAlign.center),
                    pw.Text(element.credit),
                  ],
                ),
                pw.Text(element.discription.isEmpty?"null":element.discription,
                    style: pw.TextStyle(
                      fontSize: 8,
                      color: PdfColor.fromInt(0xFF1cbcb3),
                    )),
                pw.Container(
                  margin: pw.EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  height: 1,
                  color: PdfColor.fromInt(0x999999),
                ),
              ]),
      ],
    );
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }

  String getValue(double value) {
    if (value == 0.0) {
      return "0.0";
    } else {
      return value.toStringAsFixed(2);
    }
  }
//
// String getSubTotal(List<Product> products) {
//   return products
//       .fold(0.0,
//           (double prev, element) => prev + (element.amount * element.price))
//       .toStringAsFixed(2);
// }
//
// String getVatTotal(List<Product> products) {
//   return products
//       .fold(
//     0.0,
//         (double prev, next) =>
//     prev + ((next.price / 100 * next.vatInPercent) * next.amount),
//   )
//       .toStringAsFixed(2);
// }
}