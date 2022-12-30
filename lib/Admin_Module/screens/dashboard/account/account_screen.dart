import 'package:e_commerce/provider/home_dashboard_provider.dart';
import 'package:e_commerce/screens/Dealer/payment/widget/payment_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_classes/pdf_service.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/custom_snackbar.dart';
import '../../../../helper_widgets/custom_button.dart';
import '../../../../model/admin_models/admin_ledger_model.dart';
import '../../../../provider/admin_provider/admin_ledger_provider.dart';
import '../../../../provider/cash_book_provider.dart';
import '../../../../service/Admin_Sercvice/admin_ledger_service.dart';
import '../../../../utils/functions.dart';


class Ledger extends StatefulWidget {
  const Ledger({Key? key}) : super(key: key);

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  PdfInvoiceService service=PdfInvoiceService();
  bool isFirst=false;
  int number = 0;
  String startDate="";
  String endDate="";
  _getAdminLedgerStatement() async {
    CustomLoader.showLoader(context: context);
    await AdminLedgerService().getLedgerStatement(context: context, skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {

    // print("Service $service");


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Payment Records",
      //     style: barStyle,
      //   ),
      //   backgroundColor: bgColor,
      //   centerTitle: true,
      // ),
      // bottomNavigationBar: isFirst?Container(
      //   height: 50,
      //   color: Colors.grey[100],
      //   child: Center(
      //       child: CustomButton(
      //         width: MediaQuery.of(context).size.width*0.7,
      //         text: "Create Invoice",
      //         onTap: ()async{
      //           if(startDate==""||endDate==""){
      //             CustomSnackBar.failedSnackBar(context: context, message: "Select Date First");
      //           }
      //           else if(Provider.of<CashBookProvider>(context,listen: false).cashBook!=null){
      //             final data = await service.createInvoice(Provider.of<CashBookProvider>(context,listen: false).cashBook!.result!.ledgerDetails,startDate,endDate,context);
      //
      //             service.savePdfFile("invoice_$number", data);
      //             number++;
      //           }else{
      //             CustomSnackBar.failedSnackBar(context: context, message: "No Record Found");
      //           }
      //         },
      //       )
      //   ),
      // ):SizedBox(),
      // body:
      // // RefreshIndicator(
      //   // onRefresh: () {
      //   //   // return  _getDelearStatment();
      //   //
      //   // },
      //   // child:
      //   SingleChildScrollView(
      //     physics:AlwaysScrollableScrollPhysics(),
      //     child:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isFirst?Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: Ui.getBoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Methods().getDate(DateTime.now().toString()),style: normalStyle,),
                          SizedBox(height: 10,),
                          Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total Credit",style: orderStyle,),
                              SizedBox(width: 10),
                              Text("78888",style: rsStyle,)
                            ],
                          ),
                          )
                        ],
                      )
                  ):SizedBox(height: isFirst?0.0:20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: ()async{
                            DateTime? newDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2023));
                            if(newDate==null) return;
                            setState(() {
                              print(newDate);
                              startDate=getDate(newDate);
                              if(endDate!=""){
                                isFirst=true;
                              _getAdminLedgerStatement();
                                setState(() {
                                });
                              }
                            });
                          },
                          child: Container(
                              height: 45,
                              decoration:Ui.getBoxDecoration(),
                              child: Center(child: startDate==""?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("To Date"),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ):Text(startDate),)
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: ()async{
                            DateTime? newDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2023));
                            if(newDate==null) return;
                            endDate=getDate(newDate);
                            print(endDate);
                            if(startDate!=""){
                              _getAdminLedgerStatement();
                              isFirst=true;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.only(left:10),
                            decoration: Ui.getBoxDecoration(),
                            child: Center(child: endDate==""?Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("From Date"),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ):Text(endDate)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  isFirst?Text("Leadger",style: titleStyle,):SizedBox(),
                  SizedBox(height: 10.0,),
                  isFirst?
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dealer",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("Total",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("Rec.",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("Rem.",style: titleStyle,),

                        ],
                      ),
                      Consumer<AdminLedgerProvider>(builder: (context, cash, _) {
                        return cash.ledger != null
                            ? cash.ledger!.isEmpty?Center(child: Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: Text("No Record Availible"),
                        ),)
                            :ListView.builder(
                            physics:NeverScrollableScrollPhysics(),
                            itemCount: cash.ledger!.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext, index) {
                              return LedgerWidget(
                                ledgerDetails: cash.ledger![index],
                                index: index+1,
                              );
                            })
                            : Container();
                      }),
                    ],
                  ):Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                      child:Text(" Select To Date and From Date",style:oderNoStyle,)),
                ]
            ),
          );
      //   ),
      // );
  }

  String getDate(DateTime newDate) {
    String month=newDate.toString().substring(5,7);
    String date=newDate.toString().substring(7,10);
    String year=newDate.toString().substring(0,4);
    String str=month+date+"-"+year;
    return str;
  }
}
class LedgerWidget extends StatelessWidget {
  LedgerList ledgerDetails;
  int? index;

  LedgerWidget({required this.ledgerDetails,this.index});

  @override
  Widget build(BuildContext context) {
    // String date = ledgerDetails.date!;
    // String  debitText=ledgerDetails.debit.toString();
    // String creditText=ledgerDetails.credit.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          width: MediaQuery.of(context).size.width/2.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${ledgerDetails.dealer!.name??""}",
                style: TextStyle(height: 1.4,color: Colors.black),),
              Text("${ledgerDetails.totalAmount}",
                style: TextStyle(height: 1.4,color: Colors.black),),

            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width/2.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${ledgerDetails.totalReceived}",
                style: TextStyle(height: 1.8,color: Colors.green),maxLines: 1,overflow: TextOverflow.ellipsis,),

              Text("Pending",
                style: TextStyle(height: 1.8,color: Colors.green),overflow: TextOverflow.ellipsis,maxLines:1,),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: index==1?[
        //     Icon(Icons.arrow_downward_sharp,color: Colors.green,size: 18,),
        //     Icon(Icons.arrow_upward,color: Colors.red,size: 18,),
        //   ]:index!%2==0?[
        //     Icon(Icons.arrow_downward_sharp,color: Colors.green,size: 18,),
        //   ]:[
        //     Icon(Icons.arrow_upward,color: Colors.red,size: 18,),
        //   ],
        // ),

      ],
    );
  }

}