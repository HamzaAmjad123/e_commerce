import 'package:e_commerce/provider/cash_book_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';
import '../helper_services/custom_post_request_service.dart';
import '../model/cash_book.dart';

class CashBookService {
  Future getCashBook({required BuildContext context, required int skip,required int take, required int tenantId}) async {
    try {
      Map _body = {
        "skip":skip,
        "take": take,
        "tenantId":tenantId
      };

      var res = await PostRequestService().httpPostRequest(url: cashBookUrl, body: _body, context: context);
      if (res != null) {
        CashBook cashBook=CashBook.fromJson(res);
        Provider.of<CashBookProvider>(context,listen: false).updateCashBook(
          newCashBook: cashBook,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Exception in CashBookService $e");
      return false;
    }
  }
}