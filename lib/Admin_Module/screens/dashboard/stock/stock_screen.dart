import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../configs/color.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_widgets/custom_bar_widget.dart';
import '../../../../provider/admin_provider/stock_list_provider.dart';
import '../../../../service/Admin_Sercvice/stock_list_service.dart';
import '../../../helper_widget/custom_button.dart';
import '../../../../model/admin_models/stock_model.dart';
import 'widgets/stock_edit.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  _stockListHandler()async{
    CustomLoader.showLoader(context: context);
    await StockListService().getStockList(context: context, seriesId: 0, itemTypeId: 0, skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }


  TextEditingController _searchCont=TextEditingController();
  // late List<StockModel> stockList = [];

  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     _stockListHandler();
   });
    // stockList = alldata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<StockListProvider>(builder: (context,stock,_){
        return Column(
          children: [
            CustomBarWidget(
              controller: _searchCont,
              icon: Icons.search,
              onSubmit: (value){},
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemCount: stock.stockList!.length,
              itemBuilder: (context, index) {
                return StockWidget(
                    stock:stock.stockList![index] );
              },
            ),
          ],
        );
      },),
    );
  }
}
class StockWidget extends StatefulWidget {
  StockList stock;
   StockWidget({required this.stock}) ;

  @override
  State<StockWidget> createState() => _StockWidgetState();
}

class _StockWidgetState extends State<StockWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset:
                  const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.stock.name??"",
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTapEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StockEdit()),
                          );
                        },
                        onTapView: () {},
                        textView: 'View',
                        textEdit: 'Edit',
                        editOrder: isChecked,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Series: '),
                          Text(widget.stock.series!.name ?? "",
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Stock: '),
                          Text(widget.stock.availableStock.toString() ?? "",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Price: '),
                          Text(widget.stock.unitPrice.toString()?? "",
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Discount: '),
                          Text(widget.stock.unitDiscountPercentage.toString()?? "",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Warehouse: '),
                          Text(widget.stock.warehouse!.name ?? "",
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              height: 22,
              width: 45,
              decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: isChecked == true
                  ? const Center(
                child: Text(
                  'True',
                  style: TextStyle(color: whiteColor, fontSize: 12),
                ),
              )
                  : const Center(
                child: Text(
                  'False',
                  style: TextStyle(color: whiteColor, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

