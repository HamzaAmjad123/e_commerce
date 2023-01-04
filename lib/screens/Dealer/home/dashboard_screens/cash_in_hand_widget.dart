import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/provider/home_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../provider/cash_book_provider.dart';
import '../../generate_order/generate_order_screen.dart';
import '../../order_details/pending_orders_screen.dart';
import '../../payment/payment_invoice_screen.dart';
import '../../payment/send_amount_screen.dart';

class CashInHandWidget extends StatefulWidget {
  const CashInHandWidget({Key? key}) : super(key: key);

  @override
  State<CashInHandWidget> createState() => _CashInHandWidgetState();
}

class _CashInHandWidgetState extends State<CashInHandWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 60, bottom: 20, left: 50, right: 50),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        decoration: Ui.getBoxDecoration(borderRadius: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Text("Total Amount", style: subtitleStyle),
                                  Text(Provider.of<HomeDashboardProvider>(context,listen: false).dashboard!.revenueData!.totalAmount.toString(),
                                      style: rsStyle),
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
                                  SizedBox(height: 5,),
                                  Text("Paid", style: subtitleStyle),
                                  Text(
                                      Provider.of<HomeDashboardProvider>(context,listen: false).dashboard!.revenueData!.totalPaid.toString(),
                                      style: rsStyle),
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
                                  SizedBox(height: 5,),
                                  Text("Remaining",
                                      style: subtitleStyle),
                                  Text(Provider.of<HomeDashboardProvider>(context,listen: false).dashboard!.revenueData!.totalRemaining.toString(), style: rsStyle),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context, widget: PreviousOrdersScreen());
                      },
                      child: Container(
                        height: 80,
                        width: 90,
                        decoration:Ui.getBoxDecoration(borderRadius: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                "assets/image/previous_order.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Previous Order", style: subtitleStyle),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context, widget: PaymentInvoiceScreen());
                      },
                      child: Container(
                        height: 80,
                        width: 90,
                        decoration: Ui.getBoxDecoration(borderRadius: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                "assets/image/cash_in.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Cash History", style: subtitleStyle),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context, widget: SendPaymentScreen());
                      },
                      child: Container(
                        height: 80,
                        width: 90,
                        decoration:Ui.getBoxDecoration(borderRadius: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: Image.asset("assets/image/cash_out.png",
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Send Cash", style: subtitleStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 15.0, bottom: 30.0),
                    child: Lottie.asset("assets/images/check.json",
                        height: MediaQuery.of(context).size.height / 4.5)),
                CustomButton(
                  textColor: whiteColor,
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                  text: "Order Now",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  buttonColor: bgColor,
                  horizontalMargin: 30.0,
                  // verticalMargin: 30.0,
                  onTap: () {
                    NavigationServices.goNextAndKeepHistory(
                        context: context, widget: GenerateOrderScreen());
                    setState(() {});
                  },
                ),
              ],
            );
  }
}
