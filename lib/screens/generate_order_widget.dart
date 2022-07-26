
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/helper_widgets/items_widget.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/color.dart';
import '../provider/category_provider.dart';
import '../provider/level_provider.dart';

class GenerateOrderWidget extends StatefulWidget {
  const GenerateOrderWidget({Key? key}) : super(key: key);

  @override
  State<GenerateOrderWidget> createState() => _GenerateOrderWidgetState();
}

class _GenerateOrderWidgetState extends State<GenerateOrderWidget> {
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

  int? selectSeries;
  @override
  void updateSeries(int value){
    setState(() {
      selectSeries = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<CategoriesProvider>(builder: (context,cat,_){
          return Container(
            margin: EdgeInsets.symmetric(vertical: height*.005),
            height: height*.065,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                color: lightBlackColor,
                // border: Border.all(
                //   color: Colors.black,
                // ),
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
            margin: EdgeInsets.symmetric(vertical: height*.020),
            height: height*.065,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                color:lightBlackColor,
                // border: Border.all(
                //   color: Colors.black,
                // ),
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
        Consumer<SeriesProvider>(builder: (context,series,_){
          return Container(
            margin: EdgeInsets.symmetric(vertical: height*.020),
            height: height*.065,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                color:lightBlackColor,
                // border: Border.all(
                //   color: Colors.black,
                // ),
                borderRadius: BorderRadius.circular(12.0)
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              hint: Text("Select Level"),
              value:selectSeries,
              onChanged: (int? newValue) {

                if(updateSeries != null){
                  updateSeries(newValue!);
                  setState(() {

                  });
                }
                print("Selected Category $selectedCat");
              },
              items: series.mySeries!.map((item){
                return DropdownMenuItem(
                  value: item.seriesId,
                  child: Text(item.name!),
                );
              }).toList(),
            ),
          );
        }),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 12.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Sr#"),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                    // Text("Title"),
                    // SizedBox(width: 10.0,),
                    // Text("Disc"),
                    // SizedBox(width: 10.0,),
                    // Text("U-Price"),
                    // SizedBox(width: 10.0,),
                    // Text("Qty"),
                    // SizedBox(width: 10.0,),
                    // Text("Total"),
                    ItemsWidget(
                      itemText:"Sr#" ,
                    ),
                    ItemsWidget(
                      itemText:"Title" ,
                    ),
                    ItemsWidget(
                      itemText:"Disc" ,
                    ),
                    ItemsWidget(
                      itemText:"U-Price" ,
                    ),
                    ItemsWidget(
                      itemText:"Qty" ,
                    ),
                    ItemsWidget(
                      itemText: "Total",
                    ),
                  ],
                  ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text("1")),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                    Expanded(child: Text("Physics II")),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.00,),
                    Expanded(child: Text("15%")),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                    Expanded(child: Text("150")),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                    Expanded(child: Text("1")),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                    Expanded(child: Text("150")),

                  ],
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
