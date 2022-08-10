import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SaveOrderProvider extends ChangeNotifier {
  String? message;
  String? orderId;

  updateSaveOrder({String? newMessage, String? newOrderId}) {
    message = newMessage;
    orderId = newOrderId;
    notifyListeners();
  }
}
