import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/screens/Dealer/home/custom_drawer.dart';
import 'package:e_commerce/service/cash_book_service.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
import 'package:e_commerce/service/series_services.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../payment/dealer_history_view.dart';
import 'home_screen_widgets/cash_in_hand_widget.dart';
import 'home_screen_widgets/generate_order_widget.dart';


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
   // PendingOrderWidget(),
   DealerStatmentScreen()

  ];
  int? _selectedIndex=0;
  void onitemtapped(int index){
    _selectedIndex=index;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        return await showCupertinoModalPopup(
            context: context,
            builder: (context) => Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Do you want to close your application?',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Divider(),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Yes')),
                      ],
                    )
                  ]),
                ),
              ),
            ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
        appBar:_selectedIndex==0? AppBar(
          elevation: 0,
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: Icon(Icons.menu))),
          backgroundColor: bgColor,

          title: Text("Dashboard",style: barStyle,),
          centerTitle: true,
        ):_selectedIndex==1? AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: Icon(Icons.menu))),
          backgroundColor: bgColor,

          title: Text("Dashboard",style: barStyle,),
          centerTitle: true,
        ):AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard,color: whiteColor,),label: "Home",),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "Cashbook"),
           // BottomNavigationBarItem(icon: Icon(Icons.pending),label: "Pending Order"),
            BottomNavigationBarItem(icon: Icon(Icons.money),label: "Cash History"),
          ],
          onTap: onitemtapped,
          currentIndex: _selectedIndex!,
          backgroundColor: bgColor,
          selectedLabelStyle: TextStyle(color: whiteColor,fontWeight: FontWeight.bold),
          selectedItemColor: whiteColor,
          unselectedItemColor: whiteColor,



        ),
       body: SingleChildScrollView(
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
