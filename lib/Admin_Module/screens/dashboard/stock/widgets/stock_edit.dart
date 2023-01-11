import 'package:e_commerce/service/Admin_Sercvice/admin_series_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../configs/color.dart';
import '../../../../../helper_services/custom_loader.dart';
import '../../../../../helper_widgets/custom_dropdown_button1.dart';
import '../../../../../provider/admin_provider/adimn_class_provider.dart';
import '../../../../../provider/admin_provider/admin_series_provider.dart';
import '../../../../../provider/admin_provider/admin_wearhouse_provider.dart';
import '../../../../../service/Admin_Sercvice/admin_class_service.dart';
import '../../../../../service/Admin_Sercvice/admin_wearhouse_service.dart';
import '../../../../helper_widget/custom_dropdown_button.dart';
import '../../../../helper_widget/custom_text_form_field.dart';

class StockEdit extends StatefulWidget {
  final bool isEdit;
   StockEdit({this.isEdit=false});
  @override
  State<StockEdit> createState() => _StockEditState();
}

class _StockEditState extends State<StockEdit> {
  int currentStep = 0;
  int? selectSeries;
  int? selectedWearHouse;
  int? selectedClass;
  _getAdminSiresList()async{
    CustomLoader.showLoader(context: context);
    await GetAdminSeriesService().getAdminSeries(context: context, skip: 0, take: 1000);
    await AdminWearHouseService().getWearHouse(context: context);
      CustomLoader.hideLoader(context);
  }
  getAdminClassesHandler()async{
    CustomLoader.showLoader(context: context);
    print("HERE");
    await AdminClasssService().getAllClasses(context: context);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     _getAdminSiresList();
     getAdminClassesHandler();
   });
    // TODO: implement initState
    super.initState();
  }




  final List<String> warehouseItem = [
    'Batgram Shop',
    'Lahore',
    'Peshawar',
  ];
  final List<String> itemType = [
    'Item1',
    'Item2',
    'Item3',
  ];

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Edit'),
        backgroundColor: bgColor,
        leading: IconButton(icon:Icon(Icons.arrow_back_sharp),onPressed: (){
          if(currentStep<1){
            Navigator.pop(context);
          }else{
            setState(() => currentStep -= 1);
          }
          print("currentStep  $currentStep");
        },),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            print('Complete');
          } else {
            setState(() => currentStep += 1);
          }
        },
        child: SizedBox(
          height: 40,
          width: 20,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: bgColor,
                  child: const Text("Continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: whiteColor)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Theme(
        data: ThemeData(
          // canvasColor: Colors.yellow,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: bgColor,
            // background: Colors.red,
            // secondary: Colors.green,
          ),
        ),

        child: Stepper(
          controlsBuilder: (context, controller) => Row(children: []),
          steps: getSteps(),
          currentStep: currentStep,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
              print(step);
            });
          },
          // onStepCancel: () {
          //   setState(() {
          //     currentStep > 0 ? currentStep -= 1 : currentStep = 0;
          //   });
          // },
          // onStepContinue: () {
          //   final isLastStep = currentStep == getSteps().length - 1;
          //   if (isLastStep) {
          //     print('Complete');
          //   } else {
          //     setState(() => currentStep += 1);
          //   }
          // },
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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
  List<Step> getSteps() => [
    Step(
        title: const Text("One"),
        content: Column(
          children: [
            Consumer<AdminSeriesProvider>(builder: (context,series,_){
              return series.seriesList!=null?
              CustomDropDownButton1(
                child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Select Series"),
                    value: selectSeries,
                    items:series.seriesList!.map((item) {
                      return DropdownMenuItem(
                        value: item.seriesId,
                        child: Text(item.name!),
                      );
                    }).toList(),
                    onChanged: (int? newValue){
                      selectSeries = newValue;
                      setState((){});
                    }),
              )
                  :Container();
            }),

         Consumer<AdminWearHouseProvider>(builder: (context,wear,_){
           return CustomDropDownButton1(
             child: DropdownButton(
               isExpanded: true,
               value: selectedWearHouse,
               hint: Text("Select WearHouse"),
               items:wear.adminWearHouse!.map((item)  {
                 return DropdownMenuItem(
                   value: item.warehouseId,
                   child: Text(item.name??""),
                 );
               }).toList(),
               onChanged: (int? value){
                 selectedWearHouse=value!;
                 setState(() {

                 });
               },
             ),
           );
         }),
             SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hinttext: 'Enter Item name',
              labeltext: 'Item Name*',
            ),
            const CustomTextFormField(
                hinttext: 'Enter Slogan', labeltext: 'Slogan*'),
            const CustomTextFormField(
                hinttext: 'Enter Item Code', labeltext: 'Code*'),
            Consumer<AdminClassProvider>(builder: (context,cls,_){
              return CustomDropDownButton1(
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedClass,
                  hint: Text("Select class"),
                  items:cls.classList!.map((item)  {
                    return DropdownMenuItem(
                      value: item.levelId,
                      child: Text(item.name??""),
                    );
                  }).toList(),
                  onChanged: (int? value){
                    selectedClass=value!;
                    setState(() {

                    });
                  },
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hinttext: 'Enter Unit Price',
              labeltext: 'Unit Price*',
            ),
            const CustomTextFormField(
                hinttext: 'Enter Unit Discount Percentage',
                labeltext: 'Unit Discount Percentage*'),
          ],
        ),
        isActive: currentStep >= 0),
    Step(
        title: const Text("Two"),
        content: Column(
          children: [
            CustomDropdownButton(
                buttonWidth: MediaQuery.of(context).size.width * 0.87,
                buttonHeight: 50,
                dropdownWidth: MediaQuery.of(context).size.width * 0.87,
                hint: '--Select--',
                value: selectedValue2,
                dropdownItems: itemType,
                onChanged: (value) {
                  setState(() {
                    selectedValue2 = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hinttext: 'Enter Unit Price',
              labeltext: 'Unit Price*',
            ),
            const CustomTextFormField(
                hinttext: 'Enter Unit Discount Percentage',
                labeltext: 'Unit Discount Percentage*'),
            const CustomTextFormField(
                hinttext: 'Enter Available Stock',
                labeltext: 'Available Stock*'),
            const CustomTextFormField(
                hinttext: '--Select--', labeltext: 'Status*'),
            const CustomTextFormField(
                hinttext: '--Select--', labeltext: 'Rank*'),
            CustomDropdownButton(
                buttonWidth: MediaQuery.of(context).size.width * 0.87,
                buttonHeight: 50,
                dropdownWidth: MediaQuery.of(context).size.width * 0.87,
                hint: '--Select--',
                value: selectedValue3,
                dropdownItems: itemType,
                onChanged: (value) {
                  setState(() {
                    selectedValue3 = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(),
                      );
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('Choose File'))
              ],
            )
          ],
        ),
        isActive: currentStep >= 1),
    // Step(
    //     title: const Text("Three"),
    //     content: Column(
    //       children: [
    //         const SizedBox(
    //           height: 10,
    //         ),
    //
    //       ],
    //     ),
    //     isActive: currentStep >= 2),
  ];
}
