
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
import '../../../../helper_services/navigation_services.dart';
import '../../../../helper_widgets/custom_button.dart';
import '../../../../model/admin_models/dealer_statement_by_admin_model.dart';
import '../../../../screens/Dealer/order_details/order_details_screen.dart';
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
    await DealerStatementByAdminService().getStatement(context: context, voucherId: widget.voucherId, skip: 0, take: 1000,
        fromDate: "2022-12-04T15:57:58.056Z", toDate: "2023-01-02T15:57:58.056Z");
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

        backgroundColor: bgColor,
        title: Text("Leadger Details",),

      ),
      body: SafeArea(
        child: Consumer<DealerStatementByAdminProvider>(builder: (context,leadger,_){
          return SingleChildScrollView(child: leadger.dealerStat!=null?LedgerWidget(dealerStat: leadger.dealerStat!):SizedBox());
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
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  "Order ID:"+"  ${widget.order.orderId}",
                  style: const TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft:Radius.circular(10.0),
                  ),
                ),
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
                  subtitleWhite,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.order.image!.isEmpty?Image.asset("assets/image/placeholder.png",height: 60.0,
                        width: 60.0,
                          fit: BoxFit.cover)
                          :InkWell(
                          onTap: () {
                            showImageDialog(
                                context: context,
                                url:
                                "$baseUrl${widget.order.image}");
                          },
                          child: SizedBox(
                              child: FadeInImage(image: NetworkImage("$baseUrl${widget.order.image}"), placeholder: AssetImage("assets/image/loading.gif"),  fit: BoxFit.cover,
                                height: 40.0,
                                width: 60.0,))

                          //   Image.network(
                          //   ,
                          //   fit: BoxFit.fill,
                          // )

                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationServices.goNextAndKeepHistory(
                              context: context,
                              widget:
                              OrderDetailsScreen(id: widget.order.orderId!));
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
                  width:  10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                      text: "Credit:",style:oderNoStyle,
                children: [
                        TextSpan(
                         text: " ${widget.order.credit}",style:cashStyle,)
                    ]
                    ),),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(text: TextSpan(
                        text: "Debit:",style:oderNoStyle,
                        children: [
                          TextSpan(
                            text: " ${widget.order.debit}",style:cashStyle,)
                        ]
                    ),),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Date:" +
                          Methods().getDate(widget.order.date!),
                      style: prodStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }


}

