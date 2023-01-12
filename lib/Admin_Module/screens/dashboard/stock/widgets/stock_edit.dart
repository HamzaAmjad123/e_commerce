import 'dart:io';
import 'dart:io';

import 'package:e_commerce/service/Admin_Sercvice/admin_series_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../configs/color.dart';
import '../../../../../helper_services/custom_loader.dart';
import '../../../../../helper_widgets/custom_button.dart';
import '../../../../../helper_widgets/custom_dropdown_button1.dart';
import '../../../../../helper_widgets/custom_text_fild.dart';
import '../../../../../provider/admin_provider/adimn_class_provider.dart';
import '../../../../../provider/admin_provider/admin_items_list_provider.dart';
import '../../../../../provider/admin_provider/admin_series_provider.dart';
import '../../../../../provider/admin_provider/admin_wearhouse_provider.dart';
import '../../../../../provider/admin_rank_list_provider.dart';
import '../../../../../service/Admin_Sercvice/admin_class_service.dart';
import '../../../../../service/Admin_Sercvice/admin_items_list_service.dart';
import '../../../../../service/Admin_Sercvice/admin_ranks_list_service.dart';
import '../../../../../service/Admin_Sercvice/admin_wearhouse_service.dart';
import '../../../../helper_widget/custom_dropdown_button.dart';

class StockEdit extends StatefulWidget {
  final bool isEdit;

  StockEdit({this.isEdit = false});

  @override
  State<StockEdit> createState() => _StockEditState();
}

class _StockEditState extends State<StockEdit> {
  int currentStep = 0;
  int? selectSeries;
  int? selectedWearHouse;
  int? selectedClass;
  int? selectedItems;
  int? selectedRank;
  int? selectedStock;

  List<AvailableStock> stock = [
    AvailableStock("Available", 1),
    AvailableStock("Not Available", 2)
  ];

  _getAdminSiresList() async {
    CustomLoader.showLoader(context: context);
    await GetAdminSeriesService()
        .getAdminSeries(context: context, skip: 0, take: 1000);
    await AdminClasssService().getAllClasses(context: context);
    await AdminWearHouseService().getWearHouse(context: context);
    await AdminItemsListService()
        .getItemsList(context: context, skip: 0, take: 1000);
    await AdminRanksListService().getRanks(context: context);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAdminSiresList();
    });
    // TODO: implement initState
    super.initState();
  }
  PickedFile? galleryFile;
  List<int> imageBytes=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Edit'),
        backgroundColor: bgColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            if (currentStep < 1) {
              Navigator.pop(context);
            } else {
              setState(() => currentStep -= 1);
            }
            print("currentStep  $currentStep");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<AdminSeriesProvider>(builder: (context, series, _) {
              return series.seriesList != null
                  ? CustomDropDownButton1(
                      child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text("Select Series"),
                          value: selectSeries,
                          items: series.seriesList!.map((item) {
                            return DropdownMenuItem(
                              value: item.seriesId,
                              child: Text(item.name!),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            selectSeries = newValue;
                            setState(() {});
                          }),
                    )
                  : Container();
            }),
            Consumer<AdminWearHouseProvider>(builder: (context, wear, _) {
              return CustomDropDownButton1(
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedWearHouse,
                  hint: Text("Select WearHouse"),
                  items: wear.adminWearHouse!.map((item) {
                    return DropdownMenuItem(
                      value: item.warehouseId,
                      child: Text(item.name ?? ""),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    selectedWearHouse = value!;
                    setState(() {});
                  },
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              headerText: "Iteam Name",
              shape: true,
            ),
            CustomTextField(
              headerText: 'Slogan',
              shape: true,
            ),
            CustomTextField(
              headerText: 'Item Code',
              shape: true,
            ),
            Consumer<AdminClassProvider>(builder: (context, cls, _) {
              return CustomDropDownButton1(
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedClass,
                  hint: Text("Select class"),
                  items: cls.classList!.map((item) {
                    return DropdownMenuItem(
                      value: item.levelId,
                      child: Text(item.name ?? ""),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    selectedClass = value!;
                    setState(() {});
                  },
                ),
              );
            }),
            CustomTextField(
              headerText: "Enter Unit Price",
              shape: true,
            ),
            CustomTextField(
              headerText: "Discount Percentage",
              shape: true,
            ),
            CustomTextField(
              headerText: "Available Stock",
              shape: true,
            ),
            CustomDropDownButton1(
                child: DropdownButton(
              isExpanded: true,
              value: selectedStock,
              hint: Text("Select Stock"),
              items: stock.map((item) {
                return DropdownMenuItem(
                  child: Text(item.name ?? ""),
                  value: item.id,
                );
              }).toList(),
              onChanged: (int? value) {
                selectedStock = value!;
                setState(() {});
              },
            )),
            Consumer<AdminRanksListProvider>(builder: (context, ranks, _) {
              return CustomDropDownButton1(
                  child: DropdownButton(
                isExpanded: true,
                value: selectedRank,
                hint: Text("Select Ranks"),
                items: ranks.ranksList!.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name ?? ""),
                    value: item.rankId,
                  );
                }).toList(),
                onChanged: (int? value) {
                  selectedRank = value!;
                  setState(() {});
                },
              ));
            }),
            Consumer<AdminItemsListProvider>(builder: (context, items, _) {
              return CustomDropDownButton1(
                  child: DropdownButton(
                isExpanded: true,
                value: selectedItems,
                hint: Text("Select Items Type"),
                items: items.itemsList!.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name ?? ""),
                    value: item.itemTypeId,
                  );
                }).toList(),
                onChanged: (int? value) {
                  selectedItems = value!;
                  setState(() {});
                },
              ));
            }),

            Row(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: bgColor),
                    onPressed: () {

                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(),
                      );
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('Choose File')),

                galleryFile!=null?Image.file(File(galleryFile!.path),height: 100.0,width: 200.0,):SizedBox(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: kTextTabBarHeight*1.2,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              text: "Create Stock",
              borderColor: bgColor,
              buttonColor: whiteColor,
              textColor: bgColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            'Choose Image',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),

          CustomIconButton(
            icon: Icons.image,
            text:"Gallery" ,
            onTap: (){
              getFromGallery();
              setState(() {

              });
            },

          )
        ],
      ),
    );
  }
  getFromGallery()async{
    galleryFile=await ImagePicker().getImage(source: ImageSource.gallery);
    if(galleryFile!=null);
    File imageFile=File(galleryFile!.path);
    return imageFile;
  }
  convertIntoBytes()async{
    imageBytes=await File(galleryFile!.path).readAsBytesSync();
    print("Byts $imageBytes");
    return imageBytes;
  }
}

class AvailableStock {
  final String? name;
  final int? id;

  AvailableStock(this.name, this.id);
}
