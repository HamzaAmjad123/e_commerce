import 'package:badges/badges.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/model/items_cart_model.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:e_commerce/screens/Dealer/generate_order/widget/cart_widget.dart';
import 'package:e_commerce/screens/Dealer/generate_order/widget/item_row.dart';
import 'package:e_commerce/service/save_order_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../model/items_model.dart';
import '../../../provider/class_provider.dart';
import '../../../provider/save_order_provider.dart';
import '../../../provider/wearhouse_provider.dart';
import '../../../provider/wearhouse_shipment_provider.dart';
import '../../../service/class_services.dart';
import '../../../service/get_items_service.dart';
import '../../../service/wearhouse_service.dart';
import '../../../service/wearhouse_shipment_service.dart';
import 'book_success.dart';

class GenerateOrderScreen extends StatefulWidget {
  const GenerateOrderScreen({Key? key}) : super(key: key);

  @override
  State<GenerateOrderScreen> createState() => _GenerateOrderScreenState();
}

class _GenerateOrderScreenState extends State<GenerateOrderScreen> {
  late double height;
  late double width;
  bool cargoSelect=false;
  List<Items>? items_list=[];
  int sum = 0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  final cart = CartModel.d1();
  List<CartModel> temporary_list = [];
  List<Items> dt = [];
  double cartTotal = 0.0;
  List<bool>  visibility= [];
  List<TextEditingController>  cont= [];
  List<FocusNode> focusNodes= [];
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
  int? selectedWearHouse;
  @override
  void updateWearHouse(int value) {
    setState(() {
      selectedWearHouse = value;
    });
  }
  int? selectedShipment;
  @override
  updateShipment(int value){
    selectedShipment=value;
  }
  bool shipment=false;
  getWearHouse() async {
    CustomLoader.showLoader(context: context);
    await WearHouseService().getWearHouse(context: context);

    CustomLoader.hideLoader(context);
  }
getShipment(int wearHouseId)async{
    CustomLoader.showLoader(context: context);
    await WearHouseShipmentService().getShipment(context: context, wearHouseId: wearHouseId);
    print("WearHouse $wearHouseId");
    CustomLoader.hideLoader(context);
}
  _getAllItems(int wearHouseId,int classId) async {
    CustomLoader.showLoader(context: context);
    await ItemsService().getAllItems(
      context: context,
      take: 1000,
      skip: 0,
        itemTypeId: 0,
        seriesId:0,
        warehouseId: wearHouseId,
        classId: classId
    );
    items_list=Provider.of<ItemsProvider>(context,listen: false).itemsList;
    setState(() {});
    CustomLoader.hideLoader(context);
  }
  getItems(int wearHouseId)async{
    CustomLoader.showLoader(context: context);
    await WearHouseShipmentService().getShipment(context: context, wearHouseId: wearHouseId);
    print("WearHouse $wearHouseId");
    CustomLoader.hideLoader(context);
  }
  getClassesHandler()async{
    CustomLoader.showLoader(context: context);
    await GetClassesService().getClasses(context: context);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getWearHouse();
      getClassesHandler();
    });
    super.initState();
  }



int selectedClassColor=-1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
        clearCart();
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
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<WearHouseProvider>(builder: (context,wearHouse,_){
                return wearHouse.wearHouseList!=null? Container(
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
                      hint: Text("Select WearHouse"),
                      value: selectedWearHouse,
                      items: wearHouse.wearHouseList!.map((item) {
                        return DropdownMenuItem(
                            value: item.warehouseId,
                            child: Text(item.name!),
                        );
                      }).toList(),
                      onChanged: (int? newValue){
                        if(updateWearHouse!=null)
                          updateWearHouse(newValue!);
                        shipment=true;
                        clearCart();
                        wearHouse.wearHouseList!.map((item) {
                        if(newValue==item.warehouseId){
                          if(selectedShipment==null)
                          {
                            getShipment(item.warehouseId!);
                          }
                          else{
                            selectedShipment=null;
                            getShipment(item.warehouseId!);
                          }
                        }
                        }).toList();
                        setState((){});
                      }),
                ):Container();
              }),

          if(shipment==true)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<WearHouseShipmentProvider>(builder: (context,ship,_){
                  return   Container(
                    margin: EdgeInsets.symmetric(
                        vertical: height * .005, horizontal: 14.0),
                    height: height * .065,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                        color: lightBlackColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: DropdownButton(
                        value: selectedShipment,
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("Select Shipment"),
                        items: ship.shipment!.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.name!),
                            value: item.cargoId,
                          );
                        }).toList(),
                        onChanged:(int? newValue){
                          if(updateShipment!=null)
                            updateShipment(newValue!);
                          cargoSelect=true;
                          setState((){});
                        }
                    ),
                  );
                }),
                Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Categories",style: subtitleStyle,),
                            Text("View More",style: rsStyle,),
                          ],
                        ),
                        SizedBox(height: 5,),

                        Consumer<ClassesProvider>(builder: (context,classes,_){
                          return  Container(
                            height: 70,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                primary: false,
                                itemCount: classes.myClass!.length,
                                itemBuilder: (context,index){
                                  return InkWell(
                                    onTap: ()async{
                                      items_list=[];
                                      _getAllItems(selectedWearHouse!,classes.myClass![index].levelId!);
                                      selectedClassColor=index;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 70,
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedClassColor==index?bgColor:Colors.transparent,
                                          width: 1.5
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectedClassColor==index?whiteColor:bgColor,
                                      ),
                                      child: Center(
                                        child: Text(classes.myClass![index].name!,style: selectedClassColor==index?rsStyle:subtitleWhite,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        })
                      ],
                    )
                ),

              ],
            ),
              if(shipment==true)
                selectedClassColor<0?Center(child: Text("Select Class for Items")):items_list!.length==0?Center(child: Text("No Items Availible")):
                Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          //width:MediaQuery.of(context).size.width/2.3,
                          child: GridView.builder(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisExtent:190,
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20
                              ),
                              itemCount: items_list!.length,
                              itemBuilder:(context,index){
                                return
                                  GenerateOrderWidget(
                                    item: items_list![index],
                                    onTap: () async {
                                      await onTap(
                                        index,
                                        items_list![index],
                                      );
                                      cartTotal = getItemTotal(cart);
                                      setState(() {});
                                    },
                                  );
                              })
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }

  onTap(int index, Items items) async {
    print("iss Calling");
    temporary_list.clear();
    if (cart.length > 0) {
      var last = cart.last.id;
      bool select = false;
      for (var element in cart) {
        if (element.id == items.itemId) {
          // element.qty++;
          // sum = sum + 1;
          // print("element.qty${element.qty}");
          select = true;
        } else if (last == element.id && !select) {
          sum = sum + 1;
          temporary_list.add(new CartModel(
            "assets/images/book.jpg",
              items.unitDiscountPercentage!,
              items.unitPrice!,
              items.name!,
              items.itemId!,
              1));
        }
      }
      ;
    } else {
      sum = sum + 1;
      temporary_list.add(new CartModel(
          "assets/images/book.jpg",
          items.unitDiscountPercentage!,
          items.unitPrice!,
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
              child:Column(
                children: [
                  ListView.builder(
                      itemCount: cart.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        cont.add(new TextEditingController());
                        focusNodes.add(new FocusNode());
                        if (visibility.length < cart.length) {
                          visibility.add(false);
                        }
                        return CartDrawerWidget(
                          isFirst: index==0?true:false,
                          cont: cont[index],
                          focus:focusNodes[index],
                          show: visibility[index],
                          textTap: (){
                            visibility[index]=true;
                            setState(() {});
                          },
                          onChange: (value){
                            // cont[index].text=value;
                          },
                          onSubmit: (value){
                            cont[index].text=value;
                          },
                          iconTap: (){
                            cart[index].qty=int.parse(cont[index].text);
                            visibility[index]=false;
                            cartTotal = getItemTotal(cart);
                            setState(() {});
                          },
                          deleteTap: (){
                            if (sum == 1) {
                              cart.clear();
                              dt.clear();
                              cartTotal = 0.0;
                              sum=0;
                              setState(() {});
                            } else {
                              cart.removeWhere((item) => item.id == cart[index].id);
                              cartTotal = getItemTotal(cart);
                              sum=sum-1;
                              if(cart.length==0){
                                sum=0;
                              }
                              setState(() {});
                            }
                          },
                          cartModel: cart[index],
                          subTap:(){
                            cart[index].qty--;
                            cartTotal = getItemTotal(cart);
                            setState(() {});
                          },
                          addTap: (){
                            cart[index].qty++;
                            cartTotal = getItemTotal(cart);
                            setState(() {});
                          },
                        );
                      }),
                ],
              )
          ),
        ),
      ),
    );
  }

  _saveOrder() async {
    print(cargoSelect);
    bool res =
        await SaveOrderServices().SaveOrder(context: context, list: cart,wearHouseId: selectedWearHouse!,cargoId: selectedShipment??0,value: cargoSelect);
    if (res == true) {
      clearCart();
      NavigationServices.goNextAndDoNotKeepHistory(
          context: context,
          widget: BookSuccess(
              message: Provider.of<SaveOrderProvider>(context, listen: false)
                  .message,
              orderId: Provider.of<SaveOrderProvider>(context, listen: false)
                  .orderId));
    }
  }


  getItemTotal(List<CartModel> items) {
    double sum = 0.0;
    items.forEach((e) {
      double dicount = (e.unitprice * e.discount / 100) * e.qty;
      double total = (e.unitprice * e.qty);
      sum += total - dicount;
    });
    return sum;
  }

  void clearCart() {
    items_list=[];
    sum = 0;
    cart.clear();
    dt.clear();
  }
}
