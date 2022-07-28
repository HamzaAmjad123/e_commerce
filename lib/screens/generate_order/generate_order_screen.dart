import 'package:badges/badges.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/helper_widgets/items_widget.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:e_commerce/screens/custom_drawer.dart';
import 'package:e_commerce/screens/generate_order/widget/item_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/color.dart';
import '../../helper_services/custom_loader.dart';
import '../../model/items_cart_model.dart';
import '../../model/items_model.dart';
import '../../provider/category_provider.dart';
import '../../provider/level_provider.dart';
import '../../service/get_items_service.dart';

class GenerateOrderScreen extends StatefulWidget {
  const GenerateOrderScreen({Key? key}) : super(key: key);

  @override
  State<GenerateOrderScreen> createState() => _GenerateOrderScreenState();
}

class _GenerateOrderScreenState extends State<GenerateOrderScreen> {
  late double height;
  late double width;


  int sum = 0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  final cart = CartModel.d1();
  List<CartModel> temporary_list = [];


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
    selectSeries = value;
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
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        actions: [
          Badge(
              position: BadgePosition.topEnd(top: 1, end: 25),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                sum.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                      // key.currentState!.openEndDrawer();
                    },
                    icon: Icon(
                      Icons.add_shopping_cart_sharp,
                      color: Colors.white60,
                    )),
              )),
        ],
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
                      setState(() {});
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
                  : Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            itemCount: item.itemsList!.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext, index) {
                              // cont.add(cont[index]);
                              if (cont.length < item.itemsList!.length) {
                                cont.add(new TextEditingController());
                              }
                              if (_totalPriceList.length <
                                  item.itemsList!.length) {
                                _totalPriceList.add("0");
                              }
                              return GenerateOrderWidget(
                                item: item.itemsList![index],
                                qtyController: cont[index],
                                totalPrice: _totalPriceList[index],
                                onTap: () async {
                                  if (cont[index].text.isEmpty) {
                                    CustomSnackBar.failedSnackBar(
                                        context: context,
                                        message: "add qty ist");
                                    setState(() {});
                                  } else {
                                    await onTap(
                                        index,
                                        item.itemsList![index],
                                        int.parse(cont[index].text),
                                        double.parse(_totalPriceList[index]));
                                    setState(() {});
                                  }
                                  //  print("else");
                                  // total.value = getItemTotal(controller.cart)
                                },
                                onCange: (value) {
                                  if (cont[index].value.text == "") {
                                    _totalPriceList[index] = 0.0.toString();
                                    setState(() {});
                                  } else {
                                    double price =
                                        item.itemsList![index].unitPrice!;
                                    double disc = (price *
                                            item.itemsList![index]
                                                .unitDiscountPercentage!) /
                                        100;
                                    double totalPrice = (int.parse(
                                                cont[index].value.text) *
                                            price) -
                                        (disc *
                                            int.parse(cont[index].value.text));
                                    _totalPriceList[index] =
                                        totalPrice.toString();
                                    setState(() {});
                                  }
                                },
                              );
                            }),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  onTap(int index, ItemsList items, int qty, double totalPrice) async {
    CustomSnackBar.showSnackBar(context: context, message: "added to cart succesfully");
    temporary_list.clear();
    if (cart.length > 0) {
      var last = cart.last.id;
      bool select = false;
      for (var element in cart) {
        if (element.id == items.itemId) {
          element.qty = element.qty + qty;
          element.totalprice = element.totalprice + totalPrice;
          select = true;
        } else if (last == element.id && !select) {
          sum = sum + 1;
          temporary_list.add(new CartModel(items.unitDiscountPercentage!,
              items.unitPrice!, totalPrice, items.name!, items.itemId!, qty));
        }
      }
      ;
    } else {
      sum = sum + 1;
      temporary_list.add(new CartModel(items.unitDiscountPercentage!,
          items.unitPrice!, totalPrice, items.name!, items.itemId!, qty));
    }
    cart.addAll(temporary_list);
    print(cart);
    return true;
  }

  Widget drawer(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cart.length == 0
                  ? Center(
                      child: Text("No Items Add into Cart"),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                      child: ListView.builder(
                          itemCount: cart.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("${cart[index].name}"),
                              subtitle: Text("${cart[index].unitprice}"),
                              trailing: Column(
                                children: [
                                  Text("${cart[index].qty}"),
                                  Text("${cart[index].totalprice}"),
                                ],
                              ),
                            );
                          }),
                    )),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 5),
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // ignore: deprecated_member_use
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            sum > 0
                                ? Text(
                                    '100,000',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text("0.0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor,
                        ),
                        // ignore: deprecated_member_use
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MaterialButton(
                            onPressed: () {
                              print("need to call apio for upload cart");
                            },
                            child: Center(
                              child: Text(
                                'Finish Order',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
