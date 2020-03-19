import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());

      _fcm.configure(
        //* called when the app is in the foreground and we receive a push notification
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
        },

        //* called when the app has been closed completely and it's open
        //* from the push notification
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');
        },

        //* called when the app is in the background and it's opened
        //* from the push notifications
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');
        },
      );
    }
  }
}
