import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/level_provider.dart';

import 'package:e_commerce/screens/generate_order_screen.dart';
import 'package:e_commerce/screens/custom_drawer.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
import 'package:e_commerce/service/series_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cashbook_widget.dart';

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
  Text("Asad"),
   CashbookWidget(),
   Text("ASAD"),
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

        title: Text("Generate Order",style: barStyle,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,color: whiteColor,),label: "Generate Order",),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "Cashbook"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "home"),
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
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           _widgetsList.elementAt(_selectedIndex!),
         ],
       ),
     ),

    );
  }
}
