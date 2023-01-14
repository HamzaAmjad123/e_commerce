import 'dart:io';
import 'dart:io';

import 'package:e_commerce/helper_services/custom_snackbar.dart';
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
import '../../../../../service/Admin_Sercvice/create_stock_service.dart';
import '../../../../helper_widget/custom_drop_down_text.dart';
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
  List<int> imageBytes = [];
TextEditingController nameCont=TextEditingController();
TextEditingController sloganCont=TextEditingController();
TextEditingController codeCont=TextEditingController();
TextEditingController uPriceCont=TextEditingController();
TextEditingController discCont=TextEditingController();
TextEditingController stockAvaCont=TextEditingController();
  createStockHandler() async {
    CustomLoader.showLoader(context: context);
    bool res=await CreateStockService().createStock(context: context,
        seriesId: selectSeries ?? 0,
        wearhouseId: selectedWearHouse??0,
        itemName: nameCont.text,
        slogan: sloganCont.text,
        itemCode: codeCont.text,
        classId: selectedClass??0,
        unitPrice: uPriceCont.text,
        discPercentage: discCont.text,
        availableStock: stockAvaCont.text,
        statusId: selectedStock??0,
        rankId: selectedRank??0,
        itemTypeId: selectedItems??0,
        imagesBytes: imageBytes);
    CustomLoader.hideLoader(context);
    if(res!=null){
      CustomSnackBar.showSnackBar(context: context, message: "Stock Create Successfully");
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        FocusScopeNode _currentFocus=FocusScope.of(context);
        _currentFocus.unfocus();
      },
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDDRow(
                  title1: 'Select Series',
                  title2: 'Select WearHouse',

                ),
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Consumer<AdminSeriesProvider>(builder: (context, series, _) {
        return series.seriesList != null
              ? CustomDropDownButton1(
            child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text("--Select--"),
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
    ),
    Expanded(
      child
            : Consumer<AdminWearHouseProvider>(builder: (context, wear, _) {
        return CustomDropDownButton1(
            child: DropdownButton(
              isExpanded: true,
              value: selectedWearHouse,
              underline: SizedBox(),
              hint: Text("--Select--"),
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
    ),
  ],
),

                CustomTextField(
                  headerText: "Item Name",
                  hintText: "Enter Item Name",
                  controller: nameCont,
                  shape: true,
                ),
                CustomTextField(
                  headerText: 'Slogan',
                  hintText: "Enter Slogan",
                  controller: sloganCont,
                  shape: true,
                ),
                CustomTextField(
                  headerText: 'Item Code',
                  hintText: "Enter Item Code",
                  controller: codeCont,
                  shape: true,
                ),
                CustomDDRow(
                  title1: 'Select Class',
                  title2: 'Select Rank',

                ),
            Row(
              children: [
                Expanded(
                  child: Consumer<AdminClassProvider>(builder: (context, cls, _) {
                    return CustomDropDownButton1(
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedClass,
                        underline: SizedBox(),
                        hint: Text("--Select--"),
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
                ),
                Expanded(
                  child: Consumer<AdminRanksListProvider>(builder: (context, ranks, _) {
                    return CustomDropDownButton1(
                        child: DropdownButton(
                          isExpanded: true,
                          value: selectedRank,
                          underline: SizedBox(),
                          hint: Text("--Select--"),
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
                ),
              ],
            ),
                CustomTextField(
                  headerText: "Enter Unit Price",
                  controller: uPriceCont,
                  inputType: TextInputType.number,
                  shape: true,
                ),
                CustomTextField(
                  headerText: "Discount Percentage",
                  inputType: TextInputType.number,
                  controller: discCont,
                  shape: true,
                ),
                CustomTextField(
                  headerText: "Available Stock",
                  inputType: TextInputType.number,
                  controller: stockAvaCont,
                  shape: true,
                ),
                CustomDDRow(
                  title1: 'Status',
                  title2: 'Items Type',

                ),
                CustomDropDownButton1(
                    child: DropdownButton(
                      isExpanded: true,
                      value: selectedStock,
                      underline: SizedBox(),
                      hint: Text("--Select--"),
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

                Consumer<AdminItemsListProvider>(builder: (context, items, _) {
                  return CustomDropDownButton1(
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedItems,
                        underline: SizedBox(),
                        hint: Text("--Select--"),
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
                galleryFile != null
                    ? Image.file(
                  File(galleryFile!.path),height: 100.0,width: 150.0,fit: BoxFit.fill,)
                    : SizedBox(),
                CustomIconButton(
                  width: 150.0,
                  icon: Icons.camera, text: "Choose File",onTap: (){
                  getFromGallery();
                },)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: kTextTabBarHeight * 1.2,
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
                onTap: () async{
                  await convertIntoBytes();
                 await createStockHandler();
                  setState(() {

                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }



  getFromGallery() async {
    galleryFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {

    });
    if (galleryFile != null);
    File imageFile = File(galleryFile!.path);
  }

  convertIntoBytes() async {
    imageBytes = await File(galleryFile!.path).readAsBytesSync();
    print("Byts $imageBytes");
    return imageBytes;
  }
}

class AvailableStock {
  final String? name;
  final int? id;

  AvailableStock(this.name, this.id);
}
