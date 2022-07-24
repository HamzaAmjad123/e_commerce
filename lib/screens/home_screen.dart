import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/level_provider.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
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

  String selectSeries="select Series";
  List<String> seriesList=["Series1","Series2","Series3"];

  _getServices()async{
    CustomLoader.showLoader(context: context);
   await CategoriesService().getCategory(context: context, tenatId: 0,skip: 0,take: 6);
   await LevelService().getLevel(context: context);
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

           Container(
             margin: EdgeInsets.symmetric(vertical: height*.020),
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
                 hint: Text(selectSeries),
                 items: seriesList.map((item){
                   return DropdownMenuItem(
                     value: item,
                     child: Text(item),
                   );
                 }).toList(), onChanged: (String? value){
       selectSeries=value!;
               setState((){});
             }),
           ),
         ],
       ),
     ),

    );
  }
}
