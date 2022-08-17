import 'package:e_commerce/helper_services/custom_get_request_service.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/categories_model.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';


class CategoriesService {

    Future getCategory(
        {required BuildContext context, required int tenantId, required int take, required int skip}) async {
      try {
        Map? _body = {"tenantId": tenantId, "take": take, "skip": skip};
        var res = await PostRequestService().httpPostRequest(url: getCatUrl, body: _body, context: context);

        if (res != null) {
          CategoriesModel categories = CategoriesModel.fromJson(res);
          Provider.of<CategoriesProvider>(context, listen: false).updateCat(
              newCat: categories.result
          );
          return true;
        }
        else {
          return false;
        }
      }
      catch (err) {
        print("Exception in getCat Service $err");
        return false;
      }
    }
  }
