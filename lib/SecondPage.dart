

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  final String text;
  const SecondPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[

          Text(this.text),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Prev Screen"),
          ),

          TextField(
            decoration: InputDecoration(
              hintText: "Phone Text"
            ),
            keyboardType: TextInputType.number,
            obscureText: false,
            maxLength: 10,
          ),

          TextField(
            decoration: InputDecoration(
                hintText: "Password"
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          Padding(
            padding: EdgeInsets.only(left:15, bottom: 20, right: 20, top:10), //apply padding to some sides only
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),


          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "any Text",
              border: OutlineInputBorder(),

            ),

            keyboardType: TextInputType.text,
            obscureText: false,
            maxLength: 10,
          ),
          
          Image(image: NetworkImage("https://i.pinimg.com/originals/4f/ae/53/4fae535ca7e76a966f7b432717cff19c.jpg"),
          height: 300,)
        ]),
      ),
    );
  }
}
