import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/home_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Admin_Module/helper_widget/cash_details_widget.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_widgets/custom_container_decoration.dart';
import '../../../../provider/user_data_provider.dart';
import '../../../../service/home_dashboard_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getDashboardService() async {
    CustomLoader.showLoader(context: context);
    await HomeDashboardService().getDashboardData(context: context,);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getDashboardService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeDashboardProvider>(builder: (context,dash,_){
      return dash.dashboard!=null?Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.13,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.07),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: Ui.getBoxDecoration(borderRadius: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            child: Image.asset("assets/icons/total_orders.png"),
                          ),
                          Text("Total Orders",style:orderStyle,),
                          SizedBox(height: 8),

                        ],
                      ),
                      Text(getTotal(dash.dashboard!.revenueData!.totalApprovedOrders!,dash.dashboard!.revenueData!.totalPendingOrders!),style:rsStyle)
                    ],
                  ),
                ),
              )
            ],
          ),
          CashDetailsWidget(
            totalAmount:"${dash.dashboard!.revenueData!.totalAmount.toString()}",
            totalPaid:"${dash.dashboard!.revenueData!.totalPaid}",
            totalReam:"${dash.dashboard!.revenueData!.totalRemaining}" ,
          ),
          // Container(
          //     width: double.infinity,
          //     margin: EdgeInsets.only(top: 10, bottom: 5),
          //     padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          //     decoration: Ui.getBoxDecoration(),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Expanded(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text("Total Amount", style: titleStyle),
          //               Text("Pkr ${dash.dashboard!.revenueData!.totalAmount.toString()}", style: rsStyle),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           color: Colors.black38,
          //           width: 2,
          //           height: 50,
          //         ),
          //         Expanded(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text("Total Paid", style: titleStyle),
          //               Text("Pkr ${dash.dashboard!.revenueData!.totalPaid}", style: rsStyle),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           color: Colors.black38,
          //           width: 2,
          //           height: 50,
          //         ),
          //         Expanded(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text("Remaining", style: titleStyle),
          //               Text("Pkr ${dash.dashboard!.revenueData!.totalRemaining}", style: rsStyle),
          //             ],
          //           ),
          //         ),
          //       ],
          //     )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/approved.png",
                  widget: Text(
                    'Approved\n Orders',
                    style: subtitleStyle,
                  ),
                  amountText: "${dash.dashboard!.revenueData!.totalApprovedOrders}",
                ),
              ),
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/pending.png",
                  widget: Text(
                    'Pending\n Orders',
                    style: subtitleStyle,
                  ),
                  amountText: "${dash.dashboard!.revenueData!.totalPendingOrders}",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/rejected.png",
                  widget: Text(
                    'Rejected\nOrders',
                    style: subtitleStyle,
                  ),
                  amountText: "${dash.dashboard!.revenueData!.totalRejectedOrders}",
                ),
              ),
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/return_approved.png",
                  helper: true,
                  widget: RichText(
                    text: TextSpan(
                      text: ' Returned\n Orders',
                      style: subtitleStyle,
                      children: <TextSpan>[
                        TextSpan(text:"(Approved)", style: returnStyle),
                      ],
                    ),
                  ),
                  amountText: "0",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/return_pending.png",
                  helper: true,
                  widget: RichText(
                    text: TextSpan(
                      text: ' Returned\n Orders',
                      style: subtitleStyle,
                      children: <TextSpan>[
                        TextSpan(text: "(Pending)", style: returnStyle),
                      ],
                    ),
                  ),
                  amountText: "0",
                ),
              ),
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/return_rejected.png",
                  helper: true,
                  widget: RichText(
                    text: TextSpan(
                      text: ' Returned\n Orders',
                      style: subtitleStyle,
                      children: <TextSpan>[
                        TextSpan(text: "(Rejected)", style: returnStyle),
                      ],
                    ),
                  ),
                  amountText: "0",
                ),
              ),
            ],
          ),
        ],
      ):SizedBox();
    });
  }

  String getTotal(int x, int y) {
    int c=x+y;
    return c.toString();
  }
}
