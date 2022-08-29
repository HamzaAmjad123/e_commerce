import 'package:badges/badges.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_widgets/items_widget.dart';
import 'package:e_commerce/model/items_cart_model.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:e_commerce/screens/Dealer/generate_order/widget/item_row.dart';
import 'package:e_commerce/service/save_order_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../model/items_model.dart';
import '../../../provider/category_provider.dart';
import '../../../provider/save_order_provider.dart';
import '../../../service/get_items_service.dart';
import 'book_success.dart';

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
  List<ItemsList> dt = [];
  double cartTotal = 0.0;

  List<TextEditingController> cont = [];
  List<String> _totalPriceList = [];
  String con_text = "";

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
    return WillPopScope(
      onWillPop: () async{
        sum = 0;
        cart.clear();
        dt.clear();
         Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        endDrawer: drawer(context),
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              sum = 0;
              cart.clear();
              dt.clear();
              Navigator.pop(context);
            },
          ),
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
                        Scaffold.of(context).openEndDrawer();
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
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<CategoriesProvider>(builder: (context, cat, _) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: height * .005, horizontal: 14.0),
                  height: height * .065,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      color: lightBlackColor,
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
                          await _getAllItems();
                          dt = dt =
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .itemsList!;
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
                  margin: EdgeInsets.symmetric(
                      vertical: height * .020, horizontal: 14.0),
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
                          await _getAllItems();
                          dt =
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .itemsList!;
                        }
                      }
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
                ],
              ),
              SizedBox(
                height: 5.0,
              ),

              Consumer<ItemsProvider>(builder: (context, item, _) {
                return item.itemsList!.length == 0
                    ? Center(
                        child: Text("No Item Found"),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              itemCount: item.itemsList!.length,
                              shrinkWrap: true,
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext, index) {
                                return GenerateOrderWidget(
                                  item: item.itemsList![index],
                                  onTap: () async {
                                    await onTap(
                                      index,
                                      item.itemsList![index],
                                    );
                                    cartTotal = getItemTotal(cart);
                                    setState(() {});
                                  },
                                );
                              }),
                        ),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }

  onTap(int index, ItemsList items) async {
    temporary_list.clear();
    if (cart.length > 0) {
      print("herer");
      var last = cart.last.id;
      bool select = false;
      for (var element in cart) {
        if (element.id == items.itemId) {
          print("herereeeeeeeeee");
          // element.qty++;
          // sum = sum + 1;
          // print("element.qty${element.qty}");
          select = true;
        } else if (last == element.id && !select) {
          sum = sum + 1;
          temporary_list.add(new CartModel(
              items.unitDiscountPercentage!,
              items.unitPrice!,
              dt[index].unitPrice!,
              items.name!,
              items.itemId!,
              1));
        }
      }
      ;
    } else {
      sum = sum + 1;
      temporary_list.add(new CartModel(
          items.unitDiscountPercentage!,
          items.unitPrice!,
          dt[index].unitPrice!,
          items.name!,
          items.itemId!,
          1));
    }
    cart.addAll(temporary_list);
    print(cart);
    return true;
  }

  Widget drawer(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 60,
              width: MediaQuery.of(context).size.width * 0.45,
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
                        ? Expanded(
                            child: Text(
                              '${cartTotal}',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        : Text("0.0",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      'Total Amount',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.45,
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
                      _saveOrder();
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
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Drawer(
          child: cart.length == 0
              ? Center(child: Text("No Items Add into Cart"))
              : SingleChildScrollView(
              child: ListView.builder(
                  itemCount: cart.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    cont.add(new TextEditingController());
                    if (_totalPriceList.length < cart.length) {
                      _totalPriceList.add("0");
                    }
                    return Container(
                      height: 100,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                child:
                                    Image.asset("assets/images/book.jpg"),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${cart[index].name}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${cart[index].unitprice}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "${cart[index].discount}",
                                        style: TextStyle(
                                            color: bgColor, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 30,
                                      width: 150,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        textInputAction:
                                            TextInputAction.done,
                                        controller: cont[index],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "Enter Quantity",
                                          label: Text("Enter Qty"),
                                        ),
                                        onChanged: (value) {
                                          if (cont[index].value.text ==
                                              "") {
                                            _totalPriceList[index] =
                                                0.0.toString();
                                            cart[index].qty = 0;
                                            setState(() {});
                                          } else {
                                            cart[index].qty =
                                                int.parse(value.toString());
                                            cartTotal = getItemTotal(cart);
                                            setState(() {});
                                          }
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkResponse(
                                  onTap: () {
                                    if (sum == 1) {
                                      cart.clear();
                                      dt.clear();
                                      cartTotal = 0.0;
                                      setState(() {});
                                    } else {
                                     cart.removeWhere((item) => item.id == cart[index].id);
                                      cartTotal = getItemTotal(cart);
                                      setState(() {});
                                    }
                                    sum = sum-1;
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    margin:
                                        EdgeInsets.only(top: 10, right: 5),
                                    decoration: BoxDecoration(
                                        color: bgColor,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )),
                              Text(
                                "${cart[index].qty}",
                                style: TextStyle(
                                    color: bgColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }

  _saveOrder() async {
    bool res =
        await SaveOrderServices().SaveOrder(context: context, list: cart);
    if (res == true) {
      cart.clear();
      dt.clear();
      sum = 0;
      NavigationServices.goNextAndDoNotKeepHistory(
          context: context,
          widget: BookSuccess(
              message: Provider.of<SaveOrderProvider>(context, listen: false)
                  .message,
              orderId: Provider.of<SaveOrderProvider>(context, listen: false)
                  .orderId));
    }
  }

  //Functions for drwawer
  //
  // incrementCounterCart(int i) {
  //   sum = sum + 1;
  //   cart[i].qty++;
  //   dt.forEach((element) {
  //     if (element.itemId == cart[i].id) {
  //       dt[i].qty = dt[i].qty! + 1;
  //     }
  //   });
  //   cartTotal = getItemTotal(cart);
  // }

  getCartItemTotal(CartModel items) {
    print("getCartItemTotal");
    double sum = 0;
    double dicount = (items.unitprice * items.discount / 100) * items.qty;
    double total = (items.unitprice * items.qty);
    sum = total - dicount;
    return sum;
  }

  // decrementCounterCart(int i) {
  //   sum = sum - 1;
  //   if (cart[i].qty <= 1) {
  //     cart.removeWhere((item) => item.id == cart[i].id);
  //   } else {
  //     cart[i].qty--;
  //     dt.forEach((element) {
  //       if (element.itemId == cart[i].id) {
  //         dt[i].qty = dt[i].qty! - 1;
  //       }
  //     });
  //   }
  //   cartTotal = getItemTotal(cart);
  // }

  getItemTotal(List<CartModel> items) {
    double sum = 0.0;
    items.forEach((e) {
      double dicount = (e.unitprice * e.discount / 100) * e.qty;
      double total = (e.unitprice * e.qty);
      sum += total - dicount;
    });
    return sum;
  }
}
