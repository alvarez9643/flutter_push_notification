import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  //cQAxWhkbPvE:APA91bF-ZbpOQeVMmjk7yuR4hEfSFWgcXc5YgFXQaq1WTNzF3udh87Qrmx3Fb2ie4EdqM_Ual3fZivRgQ3a_vHR-wgAQ9SwGMh8g5Q49M37eP9sxR6x3qC3wuhNcXERM6B9wojb0IWiE

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messageStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _messageStreamController.stream;

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
        var argumento = 'no-data';
        if(Platform.isAndroid){
          argumento = info['data']['comida'] ?? 'no-data';
        }
        _messageStreamController.sink.add(argumento);

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

  dispose(){
    _messageStreamController?.close();
  }
  
}