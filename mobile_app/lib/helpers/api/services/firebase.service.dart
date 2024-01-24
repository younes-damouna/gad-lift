import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseService{

  // create an instance of Firebase messaging
  final _firebaseMessaging=FirebaseMessaging.instance;


  //initialize notifications
  Future<void> initNotifications()async{
    // request permission from user
    await _firebaseMessaging.requestPermission();

    // fetch firebase cloud messaging token (FCM) for this device
    final fcmToken=await _firebaseMessaging.getToken();

    // print token(send to server)
    log('fcmToken $fcmToken');




       

  }

  //handle received messages


  //initialize foreground and background settings
}