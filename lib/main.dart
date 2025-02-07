import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/services/local_notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String? token = await FirebaseMessaging.instance.getToken();

  log("========================");
  log("Token : $token");
  log("========================");

  tz.initializeTimeZones();

  await NotificationService.notificationService.initNotification();

  runApp(
    const MyApp(),
  );
}
