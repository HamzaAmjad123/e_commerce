import 'package:e_commerce/provider/home_dashboard_provider.dart';
import 'package:e_commerce/screens/Dealer/payment/widget/payment_record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../configs/ui.dart';
import '../../../helper_classes/pdf_service.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_services/custom_snackbar.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../provider/cash_book_provider.dart';
import '../../../service/cash_book_service.dart';
import '../../../utils/functions.dart';

class PaymentInvoiceScreen extends StatefulWidget {
  const PaymentInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<PaymentInvoiceScreen> createState() => _PaymentInvoiceScreenState();
}

class _PaymentInvoiceScreenState extends State<PaymentInvoiceScreen> {
   PdfInvoiceService service=PdfInvoiceService();
  bool isFirst=false;
  int number = 0;
  String startDate="";
  String endDate="";
  _getDelearStatment() async {
    CustomLoader.showLoader(context: context);
    await CashBookService().getCashBook(context: context, skip: 0, take: 1000,searchText: "",startDate: startDate,endDate: endDate);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {

 print("Service $service");


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Records",
          style: barStyle,
        ),
        backgroundColor: bgColor,
        centerTitle: true,
      ),
      bottomNavigationBar: isFirst?Container(
        height: 50,
        color: Colors.grey[100],
        child: Center(
            child: CustomButton(
              width: MediaQuery.of(context).size.width*0.7,
              text: "Create Invoice",
              onTap: ()async{
                if(startDate==""||endDate==""){
                  CustomSnackBar.failedSnackBar(context: context, message: "Select Date First");
                }
                else if(Provider.of<CashBookProvider>(context,listen: false).cashBook!=null){
                  final data = await service.createInvoice(Provider.of<CashBookProvider>(context,listen: false).cashBook!.result!.ledgerDetails,startDate,endDate,context);

                  service.savePdfFile("invoice_$number", data);
                  number++;
                }else{
                  CustomSnackBar.failedSnackBar(context: context, message: "No Record Found");
                }
              },
            )
        ),
      ):SizedBox(),
      body: RefreshIndicator(
        onRefresh: () {
          return  _getDelearStatment();
        },
        child: SingleChildScrollView(
          physics:AlwaysScrollableScrollPhysics(),
          child: Container(
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
                            Text(Provider.of<HomeDashboardProvider>(context,listen: false).dashboard!.revenueData!.totalAmount!.toString(),style: rsStyle,)
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
                                _getDelearStatment();
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
                                _getDelearStatment();
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
                 isFirst?Text("Recent Transactions",style: titleStyle,):SizedBox(),
                  isFirst?
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sr.",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("Date",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("  Credit",style: titleStyle,),
                          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                          Text("Debit",style: titleStyle,),

                        ],
                      ),
                      Consumer<CashBookProvider>(builder: (context, cash, _) {
                        return cash.cashBook != null
                            ? cash.cashBook!.result!.ledgerDetails!.isEmpty?Center(child: Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: Text("No Record Availible"),
                            ),):ListView.builder(
                            physics:NeverScrollableScrollPhysics(),
                            itemCount: cash.cashBook!.result!.ledgerDetails!.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext, index) {
                              return PaymentRecordWidget(
                                ledgerDetails: cash.cashBook!.result!.ledgerDetails![index],
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
          ),
        ),
      ),
    );
  }

  String getDate(DateTime newDate) {
    String month=newDate.toString().substring(5,7);
    String date=newDate.toString().substring(7,10);
    String year=newDate.toString().substring(0,4);
    String str=month+date+"-"+year;
    return str;
  }
}
