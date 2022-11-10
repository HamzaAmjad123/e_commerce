import 'package:e_commerce/provider/cash_book_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';
import '../helper_services/custom_post_request_service.dart';
import '../model/cash_book_model.dart';

class CashBookService {
  Future getCashBook({required BuildContext context, required int skip,required int take,required String searchText,required String toDate,required String formDate}) async {
    print("searchText   $searchText");
    print("start   $toDate");
    print("last   $formDate");
    try {
      Map _body = {
        "skip":skip,
        "take": take,
        "searchText":searchText,
        "toDate":toDate,
        "fromDate":formDate
      };

      var res = await PostRequestService().httpPostRequest(url: cashBookUrl, body: _body, context: context);
      if (res != null) {
        CashBookModel cashBook=CashBookModel.fromJson(res);
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