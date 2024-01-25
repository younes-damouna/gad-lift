import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_app/main.dart';

class FireBaseService {
  // create an instance of Firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //initialize notifications
  Future<void> initNotifications() async {
    // request permission from user
    await _firebaseMessaging.requestPermission();

    // fetch firebase cloud messaging token (FCM) for this device
    final fcmToken = await _firebaseMessaging.getToken();

    // print token(send to server)
    log('fcmToken $fcmToken');

  }

  //handle received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // navigate to asettings screen when user taps on the notification
    navigatorKey.currentState
        ?.popAndPushNamed('/dashboard', arguments: message);
  }

  //initialize background settings
  Future initPushNotifications() async {
    // handle notification if the app was terminated and now open
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
