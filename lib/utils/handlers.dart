
import 'package:flutter/cupertino.dart';

import '../helper_services/custom_loader.dart';
import '../service/approved_oder_service.dart';
import '../service/rider_services/rider_history_service.dart';
import '../service/rider_services/rider_order_service.dart';

approvedHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await RiderOrdersService().getRiderOrderList(skip: 0, take: 1000, context: context);
  CustomLoader.hideLoader(context);
}
historyHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await RiderHistoryService().getRiderHistoryList(skip: 0, take: 1000, context: context);
  CustomLoader.hideLoader(context);
}
getDealerApprovedOrderHandler(BuildContext context,String searchText,String toDate,String formDate) async {
  CustomLoader.showLoader(context: context);
  await ApprovedOrderService().getApprovedOrder(context: context, searchText: searchText,toDate: toDate,formDate: formDate, skip: 0, take: 1000);
  CustomLoader.hideLoader(context);

}