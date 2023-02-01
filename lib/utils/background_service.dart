import 'dart:isolate';
import 'dart:ui';

import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'notification_helper.dart';


final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await RestaurantService(client: http.Client()).getRestaurants();
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
