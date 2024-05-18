import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({Key? key}) : super(key: key);

  @override
  _SharedPreferencePageState createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  final TextEditingController _controller = TextEditingController();
  Future<String> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('my_data')?? "";
    return stringValue;
  }

   setData(data) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('my_data', data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Shared Preferance Page",),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Shared Text"
                ),
                keyboardType: TextInputType.text,
                  controller: _controller,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          //var future =  this.getData() ;
                          //log(future.toString());
                          this.getData().then((value) =>  _controller.text=value);
                         // _controller.text = future.toString();
                        },
                        child: Text("Set text from Shared "),
                      ),
                      flex: 1,
                    ),

                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          log(_controller.text);
                          this.setData(_controller.text.toString());

                         // var mydata = this.getData() as String;
                         // log(mydata);

                        },
                        child: Text("put text in shared pref"),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
