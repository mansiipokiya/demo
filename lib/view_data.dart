import 'package:demo/controller.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm/src/results.dart';

class view_data extends StatefulWidget {
  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {

  @override
  Widget build(BuildContext context) {
    var config = Configuration.local([control.schema]);
    var realm = Realm(config);
    // var cars = realm.all<control>();
    RealmResults<control> conList = realm.all<control>();
    // print("${conList.length}");
    // for (int i = 0; i < conList.length; i++) {
      // print("${conList[i].name}");
    // }

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: conList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${conList[index].name}"),
            trailing: IconButton(onPressed: () {
              var realm = Realm(config);
              realm.all<control>().changes.listen((event) {
                print("data deleted...");
              });
              Future.delayed(Duration(seconds: 1));
              var Control=control("");
              realm.write(() {
                  realm.write(() {
                    realm.delete(Control);
                  });
              });
            }, icon: Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
