
import 'package:e_commerce/Admin_Module/helper_widget/custom_dropdown_button.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/service/Admin_Sercvice/admin_approval_cancel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../configs/api_urls.dart';
import '../../../../../configs/color.dart';
import '../../../../../configs/text_style.dart';
import '../../../../../configs/ui.dart';
import '../../../../../helper_services/navigation_services.dart';
import '../../../../../helper_widgets/bottom_sheet_widgeta.dart';
import '../../../../../model/admin_models/pending_orders_model.dart';
import '../../../../../screens/Dealer/order_details/objection_screen.dart';
import '../../../../../screens/Dealer/order_details/order_details_screen.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/handlers.dart';

class PendingOrderWidget extends StatefulWidget {
  PendingOrdersList order;

  PendingOrderWidget({required this.order});

  @override
  State<PendingOrderWidget> createState() => _PendingOrderWidgetState();
}

class _PendingOrderWidgetState extends State<PendingOrderWidget> {
  // _markAsDeliveredHandler() async {
  //   CustomLoader.showLoader(context: context);
  //   await MarkAsDeliveredService()
  //       .markAsDelivered(context: context, orderId: widget.order.orderId!);
  //   CustomLoader.hideLoader(context);
  // }

  int? selectedApproval;
 List<OrderApproval> approvalList=[
    OrderApproval(6, "Cancel"),
    OrderApproval(2, "Approve"),
  ];
 approvalOrCancelHandler({required int orderId,required int status})async{
   CustomLoader.showLoader(context: context);
   bool res=await ApprovalOrCancelService().getApproval(context: context, orderId: orderId, status: status);
   CustomLoader.hideLoader(context);
   if(res){
     CustomSnackBar.showSnackBar(context: context, message: "Process Perform Successfully");
     Navigator.pop(context);
     AdminPendingOrderHandler(context);
   }
 }

  @override
  Widget build(BuildContext context) {
    String date = widget.order.date!;
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
              Text(
                "PKR" + "${widget.order.totalAmount}",
                style: const TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
              SizedBox(
                height: 10,
              ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  InkWell(
                    onTap: () {
                      // buildShowObjectionDialog(context);
                      _showActionBottomSheet();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 35,
                      width: 85,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: bgColor),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: bgColor,
                            size: 18,
                          ),
                          Text(
                            "Action",
                            style:
                            TextStyle(fontSize: 14, color: bgColor),
                          )
                        ],
                      ),
                    ),
                  )
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
                "ORDER" + " " + "No" + " " + "${widget.order.orderNo}",
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
                  width: MediaQuery.of(context).size.width * 0.3,
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



_showActionBottomSheet(){

  CustomBottomSheetWidget(
      context: context,
    height: 190.0,
    child:    Wrap(
      alignment: WrapAlignment.center,
      children: [
        CustomIconButton(
          width: MediaQuery.of(context).size.width/2.4,
          icon: Icons.remove_red_eye,
          text: "View",
          onTap: (){
            NavigationServices.goNextAndKeepHistory(
                context: context,
                widget:
                OrderDetailsScreen(id: widget.order.orderId!));
          },

        ),
        CustomIconButton(
          icon: Icons.edit,
          width: MediaQuery.of(context).size.width/2.4,
          text: "Edit",
          onTap: (){
            NavigationServices.goNextAndKeepHistory(
                context: context,
                widget: ObjectionScreen(
                  orderId: widget.order.orderId!,
                ));
          },

        ),
        CustomIconButton(
          width:MediaQuery.of(context).size.width/2.0,
          icon: Icons.approval,
          text: "Approval Or Cancel",
          onTap: ()async{
            Navigator.pop(context);
            _approvalSheet();

          },

        ),
      ],
    )


  );
}

_approvalSheet(){

  CustomBottomSheetWidget(
      context: context,
      height: 170.0,
      child:StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 45.0,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  margin: EdgeInsets.symmetric(horizontal: 18.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedApproval==null?lightBlackColor:bgColor),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text("--Select--"),
                      value: selectedApproval,
                      items: approvalList.map((item){
                        return DropdownMenuItem(
                          value: item.id,
                          child: Text(item.status),

                        );
                      }).toList(), onChanged: (int?val){
                    print("value $val");
                    setState(() {
                      selectedApproval=val!;
                    });

                  }),
                ),
                Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CustomButton(
                      buttonColor: whiteColor,
                      borderColor: lightBlackColor,
                      text: "Cancel",
                      textColor: blackColor,
                      horizontalMargin: 18.0,
                      onTap: (){
                        Navigator.pop(context);
                      },

                    )),
                    Expanded(child: CustomButton(
                      text: "Save",
                      horizontalMargin: 18.0,
                      onTap: (){
                        approvalOrCancelHandler(
                       orderId: widget.order.orderId??0,
                          status: selectedApproval!,
                        );

                      },
                    )),
                  ],
                )
              ],
            );

          }));
  }
}

class OrderApproval{
  final int id;
  final String status;
  OrderApproval(this.id, this.status, );
}