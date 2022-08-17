import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/screens/home/custom_drawer.dart';
import 'package:e_commerce/service/cash_book_service.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
import 'package:e_commerce/service/series_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen_widgets/cash_in_hand_widget.dart';
import 'home_screen_widgets/generate_order_widget.dart';
import 'home_screen_widgets/pending_orders_widget.dart';

class HomeScreen extends StatefulWidget {
  int tenatId;
 HomeScreen({required this.tenatId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _getServices()async{
    CustomLoader.showLoader(context: context);
    await CategoriesService().getCategory(context: context,tenantId: widget.tenatId,skip: 0,take: 1000);
   await LevelService().getLevel(context: context);
   await SeriesServices().getSeries(context: context, tenantid: widget.tenatId, skip: 0, take: 1000);
   await CashBookService().getCashBook(context: context, skip: 0, take: 1000, tenantId: widget.tenatId);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getServices();
    });
    super.initState();
  }

 static List<Widget> _widgetsList= [
   // GenerateOrderWidget(),
   DashBoardWidget(),
   CashInHandWidget(),
   PendingOrderWidget(),

  ];
  int? _selectedIndex=0;
  void onitemtapped(int index){
    _selectedIndex=index;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();

        },
            icon: Icon(Icons.menu))),
        backgroundColor: bgColor,

        title: Text("Dashboard",style: barStyle,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,color: whiteColor,),label: "Home",),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "Cashbook"),
          BottomNavigationBarItem(icon: Icon(Icons.pending),label: "Pending Order"),
        ],
        onTap: onitemtapped,
        currentIndex: _selectedIndex!,
        backgroundColor: bgColor,
        selectedLabelStyle: TextStyle(color: whiteColor,fontWeight: FontWeight.bold),
        selectedItemColor: whiteColor,
        unselectedItemColor: whiteColor,



      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             _widgetsList.elementAt(_selectedIndex!),
           ],
         ),
       ),
     ),

    );
  }
}
