import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:i_fitness/views/splash_view.dart';



class LocalNotificationServices {

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'));
    _notificationsPlugin.initialize(initializationSettings);
  }

  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      _notificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'com.example.i_fitness',
            'i_fitness',
            importance: Importance.max,
            priority: Priority.high,
            //sound: RawResourceAndroidNotificationSound('notification2'),
            playSound: true,
            //  channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            //icon: 'launch_background',
          ),
        ),
      );
    }
  }

  static Future<void> firebaseMessagingBackgroundHandler(
   RemoteMessage message) async {
    showFlutterNotification(message);

    // await Firebase.initializeApp();
    // await setupFlutterNotifications();
    // showFlutterNotification(message);
    /// If you're going to use other Firebase services in the background, such as Firestore,
    /// make sure you call `initializeApp` before using other Firebase services.
    print('Handling a background message ${message.messageId}');
    print('Handling a background message ${message.notification!.title}');
  }

  static Future<void> setupInteractedMessage() async {
    void _handleMessage(RemoteMessage message) {
      if (message.data['type'] == 'chat') {
        // Navigator.pushNamed(context, '/chat',
        //   arguments: ChatArguments(message),
        // );
      }
    }

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }
}


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await GlobalConfiguration().loadFromAsset("config");
   FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
     await FirebaseMessaging.instance.setAutoInitEnabled(true);
   }).onError((err) {
     // Error getting token.
     print('Error getting FCM $err');
   });
   //background message
   FirebaseMessaging.onBackgroundMessage(LocalNotificationServices.firebaseMessagingBackgroundHandler);
   //background message
   FirebaseMessaging.onMessage.listen((event) async {
     // if(not.isGranted) {
     LocalNotificationServices.showFlutterNotification(event);
     // }
       print('${event.notification!.title}  Foreground state message');
   });
   LocalNotificationServices.setupInteractedMessage();
  // await GetStorage.init();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Megatron',
        theme: ThemeData(
          fontFamily: 'Mulish-Medium',
          primarySwatch: Colors.blue,
        ),
        home: const SplashView());
  }
}
