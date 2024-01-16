import 'dart:io';

import 'package:demo/controller.dart';
import 'package:demo/view_data.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Realm.init();
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: real(),));
}

class real extends StatefulWidget {
  const real({super.key});

  @override
  State<real> createState() => _realState();
}

class _realState extends State<real> {

  @override
  Widget build(BuildContext context) {
    var config = Configuration.local([control.schema]);
    // var realm = Realm(config);
    TextEditingController t1=TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(controller: t1,),
        ElevatedButton(onPressed: () async {
          var realm = Realm(config);
          // realm.all<control>().changes.listen((event) {
          //   print("data Added...");
          // });
          Future.delayed(Duration(seconds: 1));
          var Control=control("");
          realm.write(() {
            Control.name=t1.text;
            realm.add(Control);
          });
          // print(Control);


        }, child: Text("Add")),
        ElevatedButton(onPressed: () {
          var realm = Realm(config);
          var cars = realm.all<control>();
          RealmResults<control>conList=realm.all<control>();
          // print("${conList.length}");
          for(int i=0;i<conList.length;i++){
            // print("${conList[i].name}");
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return view_data();
          },));
        }, child: Text("view"))
      ],),
    );
  }
}
