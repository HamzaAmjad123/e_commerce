import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/level_provider.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
import 'package:e_commerce/service/series_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height;
  late double width;

  int? selectedCat;
  @override
  void updateCat(int value){
    setState(() {
      selectedCat = value;
    });
  }
  int? selectedLevel;
  @override
  void updateLevel(int value){
    setState(() {
      selectedLevel = value;
    });
  }

  int? selectedSer;
  @override
  void updateSeries(int value){
    setState(() {
      selectedSer= value;
    });
  }




  _getServices()async{
    CustomLoader.showLoader(context: context);
   await CategoriesService().getCategory(context: context, tenatId: 0,skip: 0,take: 6);
   await LevelService().getLevel(context: context);
   await SeriesServices().getSeries(context: context, tenantid: 0, skip: 0, take: 10000);
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

  // List<Widget> _listwidget=<Widget> [
  //   HomeScreen(),
  //   HomeScreen(),
  //   HomeScreen(),
  // ];
  // int? _selectedindex=0;
  // void onitemtapped(int index){
  //   _selectedindex=index;
  //   setState((){});
  // }

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:Text( "Generate Order",style: barStyle,),
        backgroundColor: bgColor,

      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "home"),
      //   ],
      //   onTap: onitemtapped,
      //   currentIndex: _selectedindex!,
      // ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Consumer<CategoriesProvider>(builder: (context,cat,_){
             return Container(
               height: height*.065,
               padding: EdgeInsets.symmetric(horizontal: 12.0),
               decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                   ),
                   borderRadius: BorderRadius.circular(12.0)
               ),
               child: DropdownButton(
                   isExpanded: true,
                   underline: SizedBox(),
                   hint: Text("Select Category"),
                   value: selectedCat,
                   onChanged: (int? newValue) {

                     if(updateCat != null){
                       updateCat(newValue!);
                       setState(() {

                       });
                     }
                     print("Selected Category $selectedCat");
                   },
                   items: cat.myCat!.map((item){
                     return DropdownMenuItem(
                       value: item.itemTypeId,
                       child: Text(item.name!),
                     );
                   }).toList(),
                 ),
             );
           }),
           Consumer<LevelProvider>(builder: (context,level,_){
             return Container(
               height: height*.065,
               padding: EdgeInsets.symmetric(horizontal: 12.0),
               decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                   ),
                   borderRadius: BorderRadius.circular(12.0)
               ),
               child: DropdownButton(
                 isExpanded: true,
                 underline: SizedBox(),
                 hint: Text("Select Level"),
                 value: selectedLevel,
                 onChanged: (int? newValue) {

                   if(updateLevel != null){
                     updateLevel(newValue!);
                     setState(() {

                     });
                   }
                   print("Selected Category $selectedCat");
                 },
                 items: level.myLevel!.map((item){
                   return DropdownMenuItem(
                     value: item.levelId,
                     child: Text(item.name!),
                   );
                 }).toList(),
               ),
             );
           }),

           Consumer<SeriesProvider>(builder: (context,Series,_){
             return Container(
               height: height*.065,
               padding: EdgeInsets.symmetric(horizontal: 12.0),
               decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                   ),
                   borderRadius: BorderRadius.circular(12.0)
               ),
               child: DropdownButton(
                 isExpanded: true,
                 underline: SizedBox(),
                 hint: Text("Select Series"),
                 value: selectedSer,
                 onChanged: (int? newValue) {

                   if(updateSeries != null){
                     updateSeries(newValue!);
                     setState(() {

                     });
                   }
                   print("Selected Category $selectedCat");
                 },
                 items: Series.series!.map((item){
                   return DropdownMenuItem(
                     value: item.seriesId,
                     child: Text(item.name!),
                   );
                 }).toList(),
               ),
             );
           }),

         ],
       ),
     ),

    );
  }
}
