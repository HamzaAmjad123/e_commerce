
import 'package:e_commerce/Admin_Module/constants/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/admin_provider/dealer_statement_by_admin_provider.dart';
import 'package:e_commerce/service/Admin_Sercvice/dealer_statement_by_admin_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/api_urls.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../model/admin_models/dealer_statement_by_admin_model.dart';
import '../../../../utils/functions.dart';
import '../../../helper_widget/cash_details_widget.dart';

class LedgerDetailsScreen extends StatefulWidget {
  int voucherId;
   LedgerDetailsScreen({required this.voucherId});

  @override
  State<LedgerDetailsScreen> createState() => _LedgerDetailsScreenState();
}

class _LedgerDetailsScreenState extends State<LedgerDetailsScreen> {
  dealStatByAdminHandler()async{
    CustomLoader.showLoader(context: context);
    await DealerStatementByAdminService().getStatement(context: context, voucherId: widget.voucherId, skip: 0, take: 1000, fromDate: "2022-12-04T15:57:58.056Z", toDate: "2023-01-02T15:57:58.056Z");
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dealStatByAdminHandler();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Leadger Details",),
      ),
      body: SafeArea(
        child: Consumer<DealerStatementByAdminProvider>(builder: (context,leadger,_){
          // print("TEMP${leadger.dealerStat}");
          //
          // print("TEMP1${leadger.dealerStat!.totalAmount.toString()}");
          // print("TEMP2${leadger.dealerStat!.totalReceived!}");
          return SingleChildScrollView(child: LedgerWidget(dealerStat: leadger.dealerStat!));
        },)
      ),
    );
  }
}

class LedgerWidget extends StatelessWidget {
  DealerStatementList dealerStat;
   LedgerWidget({required this.dealerStat });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CashDetailsWidget(
          totalAmount: dealerStat.totalAmount.toString(),
          totalPaid: dealerStat.totalReceived.toString(),
          totalReam: "${(dealerStat.totalAmount??0.0)-(dealerStat.totalReceived??0.0)}",
        ),
        ListView.builder(
          shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            itemCount: dealerStat.ledgerDetails!.length,
            itemBuilder: (BuildContext,index){
              return LeadgerDesign(order: dealerStat.ledgerDetails![index],);
            })
      ],
    );
  }
}



class LeadgerDesign extends StatefulWidget {
  LedgerDetails order;

  LeadgerDesign({required this.order});

  @override
  State<LeadgerDesign> createState() => _LeadgerDesignState();
}

class _LeadgerDesignState extends State<LeadgerDesign> {


  @override
  Widget build(BuildContext context) {
    // String date = widget.order.date!;
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 12.0, bottom: 12),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 10,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.order.image!.isEmpty?Image.asset("assets/image/book_placholder.jpg",height: 40.0,
                  width: 60.0,
                  fit: BoxFit.fill,):InkWell(
                    onTap: () {
                      showImageDialog(
                          context: context,
                          url:
                          "$baseUrl${widget.order.image}");
                    },
                    child: Image.network(
                      "$baseUrl${widget.order.image}",
                      height: 40.0,
                      width: 60.0,
                      fit: BoxFit.fill,
                    )),
                GestureDetector(
                  onTap: () {
                    // NavigationServices.goNextAndKeepHistory(
                    //     context: context,
                    //     widget:
                    //     OrderDetailsScreen(id: widget.order.orderId!));
                  },
                  child: Container(
                    height: 35,
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: bgColor),
                      color: Colors.white,
                    ),
                    child: Row(

                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: bgColor,
                          size: 18,
                        ),

                        Text(
                          "view",
                          style: TextStyle(
                              fontSize:
                             12.0,
                              color: bgColor,
                              fontWeight:
                                   FontWeight.normal
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
            ],
          ),
          SizedBox(
            width: widget.order.status == 4 ? 5.0 : 25.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 "${widget.order.title}",
                style: normalStyle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "26,Oct,2022 3:00 Pm",
                style: normalStyle,
              ),
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status :",
                        style: subtitleStyle,
                      ),
                      SizedBox(
                        width: widget.order.status == 7 ? 0 : 5,
                      ),
                      Expanded(
                        child: Text(
                          widget.order.status == 1
                              ? "Pending"
                              : widget.order.status == 2
                              ? "Approved"
                              : widget.order.status == 3
                              ? "Processing"
                              : widget.order.status == 4
                              ? "Shipped"
                              : widget.order.status == 5
                              ? "Delivered"
                              : widget.order.status == 6
                              ? "Cancel"
                              : widget.order.status == 7
                              ? "Ready To Shippment"
                              : "",
                          overflow: TextOverflow.ellipsis,
                          style:
                          widget.order.status == 7 ? statusStyle : rsStyle,
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
    ;
  }


}

