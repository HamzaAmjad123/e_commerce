import 'package:e_commerce/provider/Rider_providers/rider_history_provider.dart';
import 'package:e_commerce/provider/Rider_providers/rider_orders_provider.dart';
import 'package:e_commerce/provider/dealer_history_provider.dart';
import 'package:e_commerce/provider/cash_book_provider.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/home_dashboard_provider.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:e_commerce/provider/level_provider.dart';
import 'package:e_commerce/provider/order_getDeatils_provider.dart';
import 'package:e_commerce/provider/order_list_provider.dart';
import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:e_commerce/provider/save_order_provider.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Dealer Provider
        ChangeNotifierProvider(create: (context)=>UserDataProvider()),
        ChangeNotifierProvider(create: (context)=>CategoriesProvider()),
        ChangeNotifierProvider(create: (context)=>LevelProvider()),
        ChangeNotifierProvider(create: (context)=>SeriesProvider()),
        ChangeNotifierProvider(create: (context)=>ItemsProvider()),
        ChangeNotifierProvider(create: (context)=>SaveOrderProvider()),
        ChangeNotifierProvider(create: (context)=>OrderListProvider()),
        ChangeNotifierProvider(create: (context)=>OrderLogProvider()),
        ChangeNotifierProvider(create: (context)=>OrderDetailsProvider()),
        ChangeNotifierProvider(create: (context)=>CashBookProvider()),
        ChangeNotifierProvider(create: (context)=>DealerHistoryProvider()),
        ChangeNotifierProvider(create: (context)=>HomeDashboardProvider()),
        //Rider Provider
        ChangeNotifierProvider(create: (context)=>RiderHistoryProvider()),
        ChangeNotifierProvider(create: (context)=>RiderApprovesOrdersProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Implies inventory system',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
