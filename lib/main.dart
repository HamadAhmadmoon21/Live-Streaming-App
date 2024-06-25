import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
String appSign="62b8600262f6edee97f9b6167de4c7ba090b58e1afcefef635ac9324ec590c35";
main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController userID=TextEditingController();
  TextEditingController userName=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:const Text("Live Streaming",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),


      body:  Padding(
          padding:const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller:userID,
              decoration:const InputDecoration(
                  labelText:"UserID",
                  border:OutlineInputBorder(
                  )
              ),
            ),
           const SizedBox(height: 20,),
            TextField(
              controller:userName,
              decoration:const InputDecoration(
                  labelText:"User name",
                  border:OutlineInputBorder()),),
            const SizedBox(height: 20,),

            MaterialButton(
              onPressed: (){
                if(userName.text!=""&&userID.text!=""){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> StartLive(
                          userID: userID.text,
                          userName: userName.text,
                          confi: false)));
                }
              },
              color: Colors.blue,
            child:const Text("Start a live",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
           const SizedBox(height: 10,),
            MaterialButton(
              onPressed: (){
                if(userName.text!=""&&userID.text!=""){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> StartLive(
                          userID: userID.text,
                          userName: userName.text,
                          confi: true)));
                }
              },
              color: Colors.blue,
              child:const Text("Watch a live",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),



          ],
        ),
      )
    );
  }
}


class StartLive extends StatelessWidget {
  final String userID,userName;
  final bool confi;
  const StartLive({super.key,required this.userID,required this.userName,required this.confi});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
          appID: 712873095,
          appSign: appSign,
          userID: userID,
          userName: userName,
          liveID: 'test_liveID',
          config:confi? ZegoUIKitPrebuiltLiveStreamingConfig.host():
                  ZegoUIKitPrebuiltLiveStreamingConfig.audience(),

        )
    );
  }
}

