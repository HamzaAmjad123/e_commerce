import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/provider/dealer_history_provider.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/service/cash_book_service.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cash_book_model.dart';
import '../../../model/dealer_orders_model.dart';
import '../../../provider/cash_book_provider.dart';
import '../../../service/dealer_history_service.dart';
import '../../helper_classes/pdf_service.dart';
import 'order_details_screen.dart';

class ApprovedOrdersScreen extends StatefulWidget {
  const ApprovedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ApprovedOrdersScreen> createState() => _ApprovedOrdersScreenState();
}

class _ApprovedOrdersScreenState extends State<ApprovedOrdersScreen> {
  final PdfInvoiceService service = PdfInvoiceService();
  int number = 0;
 String startDate="";
  String endDate="";
  _getDelearStatment() async {
    CustomLoader.showLoader(context: context);
    await CashBookService().getCashBook(context: context, skip: 0, take: 1000, tenantId: Provider.of<UserDataProvider>(context,listen: false).user!.user!.tenantId!);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getDelearStatment();
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Approved Orders",
          style: barStyle,
        ),
        backgroundColor: bgColor,
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
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
                final data = await service.createInvoice(Provider.of<CashBookProvider>(context,listen: false).cashBook!.result!.ledgerDetails);
                service.savePdfFile("invoice_$number", data);
                number++;
              }else{
                CustomSnackBar.failedSnackBar(context: context, message: "No Record Found");
              }
            },
          )
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return  _getDelearStatment();
        },
        child: SingleChildScrollView(
          physics:AlwaysScrollableScrollPhysics(),
          child: Container(
            color: Colors.black12,
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: bgColor, width: 1.3)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: blackColor,
                        )),
                  ),
                ),
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
                            startDate=Methods().getFormatedDate(newDate.toString());
                            print(startDate);
                          });
                        },
                        child: Container(
                            height: 40,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black,width: 1),

                            ),
                            child: Center(child: startDate==""?Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Select StartDate"),
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
                          setState(() {
                            endDate=Methods().getFormatedDate(newDate.toString());
                            print(endDate);
                          });
                        },
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black,width: 1),
                          ),
                          child: Center(child: endDate==""?Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Select EndingDate"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ):Text(endDate)),
                        ),
                      ),
                    ),
                  ],
                ),
                startDate!=""&&endDate!=""?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sr."),
                        Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                        Text("Date"),
                        Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                        Text("Amount"),
                        Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                        Text("Balance"),

                      ],
                    ),
                  ),
                  Consumer<CashBookProvider>(builder: (context, cash, _) {
                    return cash.cashBook != null
                        ? ListView.builder(
                        physics:NeverScrollableScrollPhysics(),
                        itemCount: cash.cashBook!.result!.ledgerDetails!.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          return ApprovedOrderWidget(
                            ledgerDetails: cash.cashBook!.result!.ledgerDetails![index],
                            index: index+1,
                          );
                        })
                        : Container();
                  }),
                ],
              ):Center(child:Text("please select start and lastdate")),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
class ApprovedOrderWidget extends StatelessWidget {
  LedgerDetails ledgerDetails;
  int? index;

  ApprovedOrderWidget({required this.ledgerDetails,this.index});

  @override
  Widget build(BuildContext context) {
    String date = ledgerDetails.date!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Center(
                child: Text("${index} :-",
                  style: TextStyle(height: 1.4,color: Colors.black),),
              )),
          Expanded(
            child: Container(
                child: Center(
                  child: Text("${Methods().getFormatedDate(date)}",
                    style: TextStyle(height: 1.4,color: Colors.black),),
                )),
          ),
          Expanded(child: Container(
              child: Center(
                child: Text(" ${ledgerDetails.credit}",
                  style: TextStyle(height: 1.8,color: Colors.green),),
              )
          ),),
         Expanded(child:  Container(
             child: Center(
               child: Text(" ${ledgerDetails.debit}",
                 style: TextStyle(height: 2,color: Colors.red),),
             )
         )),

        ],
      ),
    );
  }

}


