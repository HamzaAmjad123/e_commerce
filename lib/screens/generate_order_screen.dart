import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/helper_widgets/items_widget.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:e_commerce/screens/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/color.dart';
import '../helper_services/custom_loader.dart';
import '../model/items_model.dart';
import '../provider/category_provider.dart';
import '../provider/level_provider.dart';
import '../service/get_items_service.dart';

class GenerateOrderScreen extends StatefulWidget {
  const GenerateOrderScreen({Key? key}) : super(key: key);

  @override
  State<GenerateOrderScreen> createState() => _GenerateOrderScreenState();
}

class _GenerateOrderScreenState extends State<GenerateOrderScreen> {
  late double height;
  late double width;

  List<TextEditingController> cont = [];
  List<String> _totalPriceList = [];

  bool catSelected = false;
  bool seriesSelected = false;

  int? selectedCat;

  @override
  void updateCat(int value) {
    setState(() {
      selectedCat = value;
    });
  }

  int? selectedLevel;

  @override
  void updateLevel(int value) {
    setState(() {
      selectedLevel = value;
    });
  }

  int? selectSeries;

  @override
  void updateSeries(int value) {
    selectSeries=value;
    setState(() {});
  }

  _getAllItems() async {
    CustomLoader.showLoader(context: context);
    await ItemsService().getAllItems(
        context: context,
        take: 1000,
        skip: 0,
        seriesId: selectSeries!,
        itemId: selectedCat!);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: Text(
          "Generate Order",
          style: barStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<CategoriesProvider>(builder: (context, cat, _) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: height * .005),
                height: height * .065,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                    color: lightBlackColor,
                    // border: Border.all(
                    //   color: Colors.black,
                    // ),
                    borderRadius: BorderRadius.circular(12.0)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select Category"),
                  value: selectedCat,
                  onChanged: (int? newValue) async {
                    if (updateCat != null) {
                      updateCat(newValue!);

                      catSelected = true;
                      setState(() {
                      });
                      if (catSelected == true && seriesSelected == true) {
                        print("calling itemapi");
                        await _getAllItems();
                      }

                    }
                    print("Selected Category $selectedCat");
                  },
                  items: cat.myCat!.map((item) {
                    return DropdownMenuItem(
                      value: item.itemTypeId,
                      child: Text(item.name!),
                    );
                  }).toList(),
                ),
              );
            }),
            // Consumer<LevelProvider>(builder: (context,level,_){
            //   return Container(
            //     margin: EdgeInsets.symmetric(vertical: height*.020),
            //     height: height*.065,
            //     padding: EdgeInsets.symmetric(horizontal: 12.0),
            //     decoration: BoxDecoration(
            //         color:lightBlackColor,
            //         // border: Border.all(
            //         //   color: Colors.black,
            //         // ),
            //         borderRadius: BorderRadius.circular(12.0)
            //     ),
            //     child: DropdownButton(
            //       isExpanded: true,
            //       underline: SizedBox(),
            //       hint: Text("Select Class"),
            //       value: selectedLevel,
            //       onChanged: (int? newValue) {
            //
            //         if(updateLevel != null){
            //           updateLevel(newValue!);
            //           setState(() {
            //
            //           });
            //         }
            //         print("Selected Category $selectedCat");
            //       },
            //       items: level.myLevel!.map((item){
            //         return DropdownMenuItem(
            //           value: item.levelId,
            //           child: Text(item.name!),
            //         );
            //       }).toList(),
            //     ),
            //   );
            // }),
            Consumer<SeriesProvider>(builder: (context, series, _) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: height * .020),
                height: height * .065,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                    color: lightBlackColor,
                    // border: Border.all(
                    //   color: Colors.black,
                    // ),
                    borderRadius: BorderRadius.circular(12.0)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select Series"),
                  value: selectSeries,
                  onChanged: (int? newValue) async {
                    seriesSelected = true;
                    if (updateSeries != null) {
                      updateSeries(newValue!);
                      setState(() {});
                      if (catSelected == true && seriesSelected == true) {
                        print("calling api");
                        await _getAllItems();
                      }

                    }
                    print("Selected Category $selectedCat");
                  },
                  items: series.mySeries!.map((item) {
                    return DropdownMenuItem(
                      value: item.seriesId,
                      child: Text(item.name!),
                    );
                  }).toList(),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemsWidget(
                  itemText: "Title",
                ),
                ItemsWidget(
                  itemText: "Disc",
                ),
                ItemsWidget(
                  itemText: "U-Price",
                ),
                ItemsWidget(
                  itemText: "Qty",
                ),
                ItemsWidget(
                  itemText: "Total",
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),

            Consumer<ItemsProvider>(builder: (context, item, _) {
              return item.itemsList!.length == 0
                  ? Container(
                      child: Text("No Item Found"),
                    )
                  : ListView.builder(
                      itemCount: item.itemsList!.length,
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext, index) {
                        // cont.add(cont[index]);
                        if (cont.length < item.itemsList!.length) {
                          cont.add(new TextEditingController(text: "0"));
                        }
                        if (_totalPriceList.length < item.itemsList!.length) {
                          _totalPriceList.add("0");
                        }
                        return GenerateOrderWidget(
                          item: item.itemsList![index],
                          qtyController: cont[index],
                          totalPrice: _totalPriceList[index],
                          onCange: (value) {
                            double price = item.itemsList![index].unitPrice!;
                            double disc = (price *
                                    item.itemsList![index]
                                        .unitDiscountPercentage!) /
                                100;
                            double totalPrice =
                                (int.parse(cont[index].text) * price) -
                                    (disc * int.parse(cont[index].text));
                            _totalPriceList[index] = totalPrice.toString();
                            setState(() {});
                          },
                        );
                      });
            })
          ],
        ),
      ),
    );
  }
}

class GenerateOrderWidget extends StatelessWidget {
  ItemsList item;
  final Function(String)? onCange;
  final String? totalPrice;
  TextEditingController qtyController;

  GenerateOrderWidget(
      {required this.item,
      required this.qtyController,
      this.onCange,
      this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 3.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(item.name!)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.00,
              ),
              Expanded(child: Text("${item.unitDiscountPercentage}")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Expanded(child: Text("${item.unitPrice}")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                height: 30,
                width: 30,
                child: TextField(
                  onChanged: onCange,
                  controller: qtyController,
                  keyboardType: TextInputType.numberWithOptions(),

                  // maxLines: 1,
                  // maxLength: 4,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  // controller: qtyController[index],
                  decoration: InputDecoration(hintText: "12"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Expanded(child: Text(totalPrice!)),
              // Expanded(child: Text("12")),
            ],
          ),
        ),
      ),
    );
  }
}
