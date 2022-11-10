import 'package:e_commerce/screens/Rider/widget/approved_widget.dart';
import 'package:e_commerce/screens/Rider/widget/history_widget.dart';
import 'package:e_commerce/utils/handlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configs/color.dart';
import '../../configs/dialogues/show_will_pop_dialog.dart';
import '../Dealer/home/custom_drawer.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    approvedHandler(context);
    historyHandler(context);
    });
    super.initState();
  }

  static List<Widget> _widgetsList = [
    RiderApprovedOrder(),
    RiderHistory(),
  ];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final shouldPop = await showCupertinoModalPopup(
            context: context, builder: (context){
          return showWillPopDialog(context);
        });
        return shouldPop!;
    },
      child: Scaffold(
          drawer: CustomDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_rounded),
                label: "Approved Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Order History",
              ),
            ],
            onTap: onItemTapped,
            currentIndex: selectedIndex,
            backgroundColor: bgColor,
            selectedLabelStyle:
                TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            selectedItemColor: whiteColor,
            unselectedItemColor: whiteColor,
          ),
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              "Rider screen",
              style: TextStyle(color: Colors.white),
            ),
            leading: Builder(builder: (context)=>IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();

            },
                icon: Icon(Icons.menu))),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: SingleChildScrollView(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _widgetsList.elementAt(selectedIndex),
                ],
              ),
            ),
          )),
    );
  }
}
