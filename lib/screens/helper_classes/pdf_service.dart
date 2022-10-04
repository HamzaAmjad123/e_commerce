import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/model/cash_book_model.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../model/user_model.dart';



class CustomRow {
  final String serialNo;
  final String date;
  final String debit;
  final String credit;
  final String discription;

  CustomRow(this.serialNo, this.date, this.debit, this.credit,this.discription);
}

class PdfInvoiceService {
  final box = GetStorage();
  UserModel? usermodels;
  PdfInvoiceService(){
    usermodels = UserModel.fromJson(box.read('user'));
  }

  Future<Uint8List> createInvoice(List<LedgerDetails>? ledgerDetails) async {
    final pdf = pw.Document();

    final List<CustomRow> elements = [
      CustomRow("Sr.No","date", "discription","debit", "credit"),
      for(int i=0;i<ledgerDetails!.length;i++)
        CustomRow(i.toStringAsFixed(2), Methods().getFormatedDate(ledgerDetails[i].date!),ledgerDetails[i].description!,getValue(ledgerDetails[i].debit?? 0.0), getValue(ledgerDetails[i].credit?? 0.0))
    ];
    final image = (await rootBundle.load("assets/image/app_logo.png"))
        .buffer
        .asUint8List();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Image(pw.MemoryImage(image),
                  fit: pw.BoxFit.fill),
              pw.SizedBox(height: 25),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(

                    children: [
                      pw.Text("Customer Name"),
                      pw.Text("Customer Email"),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(usermodels!.name!),
                      pw.Text(usermodels!.email!),
                    ],
                  )
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                  "Dear Customer, thanks for Using Implies Invetory Application"),
              pw.SizedBox(height: 25),
              itemColumn(elements),
              pw.SizedBox(height: 25),
              pw.Text("Thanks for your trust, and till the next time."),
              pw.SizedBox(height: 25),
              pw.Text("Kind regards,"),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.Expanded itemColumn(List<CustomRow> elements) {
    return pw.Expanded(
      child: pw.Column(
        children: [
          for (var element in elements)
            pw.Row(
              children: [
                pw.Expanded(
                    child: pw.Text(element.serialNo,
                        textAlign: pw.TextAlign.left)),
                pw.Expanded(
                    child:/*pw.Column(
                      children: [
                        pw.Text(element.date,),
                        pw.Text(element.discription),
                      ],
                    )*/

                  pw.Text(element.date,
                        textAlign: pw.TextAlign.right)


                ),
                pw.Expanded(
                    child:
                    pw.Text(element.debit, textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child:
                    pw.Text(element.credit, textAlign: pw.TextAlign.right)),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenDocument.openDocument(filePath: filePath);
  }

  String getValue(double value) {
    if(value==0.0){
      return "0.0";
    }
    else{
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