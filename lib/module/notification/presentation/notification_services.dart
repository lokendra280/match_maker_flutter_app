import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/presentation/widget/toast.dart';

class NotificationServices{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
    CustomToast.showSuccessToast("User granted Notification Permission");

    }else if(settings.authorizationStatus == AuthorizationStatus.authorized){
    CustomToast.showSuccessToast("User granted provisional permission");

    }else{
  CustomToast.showErrorToast("User denied Permission");

    }
  }

  Future<String> getDeviceToken()async{
    String? token = await messaging.getToken();
    return token!;
  }
}