import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.all(10),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.ac_unit_sharp),
              title: Text("My Item ${index+1}" ),
            ),
          ),
        );
      })
    );
  }
}
