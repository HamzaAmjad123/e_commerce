
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

  String selectSeries="select Series";
  List<String> seriesList=["Series1","Series2","Series3"];


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

        Container(
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
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 3.0,
          margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 12.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Text("Sr#"),
                // Text("1"),
                // Text("Book Name"),
                // Text("Consenten"),
                // Text("Series Name"),
                // Text("Ilmi Book Series"),
                // Text("Discount"),
                // Text("15%"),
                // Text("Unit Price"),
                // Text("${"150"}"),
                // Text("Quantity"),
                // Text("1"),
                // Text("Total"),
                // Text("150")
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text("Sr#")),
                    Expanded(child: Text("Book Name")),
                    Expanded(child: Text("Series Name")),
                    Expanded(child: Text("Discount")),
                    Expanded(child: Text("Unit Price")),
                    Expanded(child: Text("Quantity")),
                    Expanded(child: Text("Total")),
                  ],
                  ),
                Row(
                  children: [
                    Expanded(child: Text("1")),
                    Expanded(child: Text("Physics")),
                    Expanded(child: Text("Series Name")),
                    Expanded(child: Text("15%")),
                    Expanded(child: Text("150")),
                    Expanded(child: Text("1")),
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
