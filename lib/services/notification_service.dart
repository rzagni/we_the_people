import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:we_the_people/dataconnect_generated/app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background message received: ${message.messageId}');
  debugPrint('Background message data: ${message.data}');
}

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    await _requestPermission();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message received: ${message.messageId}');
      debugPrint('Foreground message title: ${message.notification?.title}');
      debugPrint('Foreground message body: ${message.notification?.body}');
      debugPrint('Foreground message data: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification opened app: ${message.messageId}');
      debugPrint('Opened with data: ${message.data}');
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('App launched from terminated state by notification.');
      debugPrint('Initial message data: ${initialMessage.data}');
    }

    final token = await _messaging.getToken();
    debugPrint('FCM token: $token');

    if (token != null) {
      await registerCurrentDevice(token);
    }

    _messaging.onTokenRefresh.listen((newToken) async {
      debugPrint('FCM token refreshed: $newToken');
      await registerCurrentDevice(newToken);
    });
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );

    debugPrint(
      'Notification permission status: ${settings.authorizationStatus}',
    );
  }

  Future<void> registerCurrentDevice(String token) async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      debugPrint('Skipping device registration: no logged in user.');
      return;
    }

    final deviceId = '${firebaseUser.uid}_${_platformName()}';

    await AppConnector.instance
        .registerUserDevice(
          id: deviceId,
          userId: firebaseUser.uid,
          fcmToken: token,
          platform: _platformEnum(),
          notificationsEnabled: true,
        )
        .execute();

    debugPrint('Device registered in Data Connect.');
  }

  DevicePlatform _platformEnum() {
    if (kIsWeb) {
      return DevicePlatform.WEB;
    }

    if (Platform.isIOS) {
      return DevicePlatform.IOS;
    }

    return DevicePlatform.ANDROID;
  }

  String _platformName() {
    if (kIsWeb) return 'web';
    if (Platform.isIOS) return 'ios';
    return 'android';
  }
}
