
import 'package:flutter/cupertino.dart';

import '../helper_services/custom_loader.dart';
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