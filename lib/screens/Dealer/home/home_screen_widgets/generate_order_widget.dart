import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_widgets/custom_container_decoration.dart';
import '../../../../provider/user_data_provider.dart';
import '../../../../service/home_dashboard_service.dart';

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
  Future getDashboardService() async {
    CustomLoader.showLoader(context: context);
    await HomeDashboardService().getDashboardData(
        context: context,
        dealerId: Provider.of<UserDataProvider>(context, listen: false)
            .user!
            .user!
            .id!);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // getDashboardService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                      Text("50",style:rsStyle)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, bottom: 5),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              decoration: Ui.getBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total Amount", style: titleStyle),
                        Text("Pkr 20,000", style: rsStyle),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black38,
                    width: 2,
                    height: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total Paid", style: titleStyle),
                        Text("Pkr 20,000", style: rsStyle),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black38,
                    width: 2,
                    height: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total \nPending", style: titleStyle),
                        Text("Pkr 20,000", style: rsStyle),
                      ],
                    ),
                  ),
                ],
              )),
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
                  amountText: "20,000",
                ),
              ),
              Expanded(
                child: CustomContainerDecoration(
                  imgUrl: "assets/icons/pending.png",
                  widget: Text(
                    'Pending\n Orders',
                    style: subtitleStyle,
                  ),
                  amountText: "20,000",
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
                  amountText: "20,000",
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
                  amountText: "20,000",
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
                  amountText: "20,000",
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
                  amountText: "20,000",
                ),
              ),
            ],
          ),
        ],
      );
  }
}
