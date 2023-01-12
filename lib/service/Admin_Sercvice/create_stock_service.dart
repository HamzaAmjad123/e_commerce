import 'package:flutter/cupertino.dart';

class CreateStockService {
  Future createStock({required BuildContext context,
    required int seriesId,
    required int wearhouseId,
    required String itemName,
    required String slogan,
    required String itemCode,
    required int classId,
    required String unitPrice,
    required String discPercentage,
    required String availableStock,
    required int statusId,
    required int rankId,
    required int itemTypeId,
    required List<int> imagesBytes,

  }) async {
    try {
      Map _body = {

        "availableStock": availableStock,
        "classId": classId,
        "code": itemCode,
        "image": imagesBytes,
        "itemTypeId": itemTypeId,
        "name": itemName,
        "rankId": rankId,
        "seriesId":seriesId,
        "slogan": slogan,
        "status": statusId,
        "unitDiscountPercentage": discPercentage,
        "unitPrice": unitPrice,
        "warehouseId": wearhouseId
      };
    }
    catch (err) {
      print("Exception in Edit Stock Service $err");
      return null;
    }
  }
}
