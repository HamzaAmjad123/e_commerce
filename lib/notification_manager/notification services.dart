import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  //local notifictions for android
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');

//initilized setting for android
  void initilizeNotification(
      BuildContext context, RemoteMessage message) async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );

    //for initilize setting and handle local notification click
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payLoad) {
          handleMessage(context, message);
        });
  }

// when notification arrive in bacckgroud
  Future<void> setupInteractMessage(BuildContext context) async {
    //when app is terminated
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }
    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  //send loacl notification in the app
  void sendNotification(
      String body,
      String title,
      ) async {
    AndroidNotificationDetails androidNotificationDetails =
    //channelname and channrlId given
    AndroidNotificationDetails("Ecomrece", "EcomreceNotification",icon: '@mipmap/ic_launcher',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  //handle navigation on click on local notification
  void handleMessage(BuildContext context, RemoteMessage message) {
    print("message data in notification service ${message.data}");
    // Get.toNamed(RouteConstants.allNotifications);
    if(message.data['key']=="no"){
      // Get.toNamed(RouteConstants.allNotifications);
    }else{

    }
  }
}