import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificatinEx extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificatinEx();
  }
}

class _NotificatinEx extends State<NotificatinEx> with WidgetsBindingObserver {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    flutterLocalNotificationsPlugin=new FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings android=new AndroidInitializationSettings("@mipmap/ic_launcher");
    IOSInitializationSettings ios=new IOSInitializationSettings();
    var initSetting=new InitializationSettings(android,ios);
    flutterLocalNotificationsPlugin.initialize(initSetting,onSelectNotification: showMessage);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Column(

          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50),),
            new RaisedButton(onPressed: (){
              showNotification();
            },child: new Text("show message"),)
          ],
        ),
      ),
    );
  }
void showNotification(){
    var androidNoti=new AndroidNotificationDetails("channelId","channelName","channelDescription",priority: Priority.High);
    var iosNoti=new IOSNotificationDetails();
    var notiSetting= new NotificationDetails(androidNoti,iosNoti);
    //flutterLocalNotificationsPlugin.showDailyAtTime(0, "title", "body",new Time(13,11,0), notiSetting,payload: "send message");
    flutterLocalNotificationsPlugin.show(0, "title", "body", notiSetting,payload: "send message");



}
  Future showMessage (String payload) {
    String rr='hiiiii';
    print("$rr");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


}
