import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_widgets/custom_bar_widget.dart';
import '../../../../model/admin_models/admin_ledger_model.dart';
import '../../../../provider/admin_provider/admin_ledger_provider.dart';
import '../../../../service/Admin_Sercvice/admin_ledger_service.dart';
import '../../../admin_pdf_service.dart';
import 'leadger_details_screen.dart';


class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {

  bool isFirst=false;
  bool isIcon=false;


  _getAdminLedgerStatement() async {
    CustomLoader.showLoader(context: context);
    await AdminLedgerService().getLedgerStatement(context: context, skip: 0, take: 1000,searchText:isIcon?_searchCont.text:"");
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAdminLedgerStatement();
    });
    // print("Service $service");


    super.initState();
  }
  TextEditingController  _searchCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBarWidget(
                    controller: _searchCont,
                    onSubmit: (value){

                      if(isIcon==true){
                        _searchCont.clear();
                      }
                      isIcon=!isIcon;
                      _getAdminLedgerStatement();
                      setState(() {

                      });
                    },
                    icon: isIcon==false? Icons.search:Icons.clear,
                    iconOnTap: (){
                      if(isIcon==true){
                        _searchCont.clear();
                      }
                      isIcon=!isIcon;
                      _getAdminLedgerStatement();


                    },
                  ),


                  Text("Accounts",style: leadgerStyle,),
                  SizedBox(height: 10.0,),
                  // isFirst?
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
                          Text("View.",style: titleStyle,),

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
                  )
                      // :Container(
                      // alignment: Alignment.center,
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                      // child:Text(" Select To Date and From Date",style:oderNoStyle,)),
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
  AdminLedgerList ledgerDetails;
  int? index;

  LedgerWidget({required this.ledgerDetails,this.index});
  AdminPdfInvoiceService service=AdminPdfInvoiceService();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    // String date = ledgerDetails.date!;
    // String  debitText=ledgerDetails.debit.toString();
    // String creditText=ledgerDetails.credit.toString();
    return Center(
      child: Container(

        padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: Ui.getBoxDecoration(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Text("${ledgerDetails.dealer!.name??""}",
                style: TextStyle(height: 1.4,color: Colors.black),maxLines: 1,),

            ),
            Expanded(
              child: Text("${ledgerDetails.totalAmount}",
                style: TextStyle(height: 1.4,color: Colors.black),maxLines: 1,),

            ),
            Expanded(
              child: Text("${ledgerDetails.totalReceived}",
                style: TextStyle(height: 1.8,color: Colors.green),maxLines: 1,overflow: TextOverflow.ellipsis,),

            ),

            // Expanded(
            //   child: Text(
            //     "${(ledgerDetails.totalAmount!-ledgerDetails.totalReceived!).toString()}",
            //     style: TextStyle(height: 1.8,color: Colors.green),overflow: TextOverflow.ellipsis,maxLines:1,),
            //
            // ),
            InkWell(


                  onTap: ()async{
                    NavigationServices.goNextAndKeepHistory(context: context, widget: LedgerDetailsScreen(
                      voucherId:ledgerDetails.voucherId??0 ,
                    ));

                  //   if(Provider.of<DealerStatementByAdminProvider>(context,listen: false).dealerStat!=null){
                  //     final data = await service.createInvoice(Provider.of<DealerStatementByAdminProvider>(context,listen: false).dealerStat!,"","",context);
                  //
                  //     service.savePdfFile("invoice_$number", data);
                  //     number++;
                  //   }else{
                  //     CustomSnackBar.failedSnackBar(context: context, message: "No Record Found");
                  //   }
                  },

                child: Icon(Icons.visibility,size: 20.0,))


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
        ),
      ),
    );
  }

}