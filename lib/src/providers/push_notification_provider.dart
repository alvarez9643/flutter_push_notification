import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  //cQAxWhkbPvE:APA91bF-ZbpOQeVMmjk7yuR4hEfSFWgcXc5YgFXQaq1WTNzF3udh87Qrmx3Fb2ie4EdqM_Ual3fZivRgQ3a_vHR-wgAQ9SwGMh8g5Q49M37eP9sxR6x3qC3wuhNcXERM6B9wojb0IWiE

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotification(){
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print("Token ================");
      print(token);
    });

    _firebaseMessaging.configure(

      onMessage: (info ) async{
        print('on Message');
        print(info);
        final noti = info['data']['comida'];
        print(noti);
      },

      onLaunch: (info) async {
        print('on onLaunch');
        print(info);

        final noti = info['data']['comida'];
        print(noti);
      },
      
      onResume: (info) async{
        print('on onResume');
        print(info);
        final noti = info['data']['comida'];
        print(noti);
      }

    );

  }
  
}