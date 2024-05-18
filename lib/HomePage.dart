import 'package:firtstproj/ImagePickerPage.dart';
import 'package:firtstproj/ListviewPage.dart';
import 'package:firtstproj/NavigationDrawerPage.dart';
import 'package:firtstproj/SampleApiCallPage.dart';
import 'package:firtstproj/SecondPage.dart';
import 'package:firtstproj/SharedPreferencePage.dart';
import 'package:firtstproj/TabView.dart';
import 'package:firtstproj/ThirdPage.dart';
import 'package:firtstproj/WebViewPage.dart';
import 'package:firtstproj/custom_dialog_box.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Image(image: AssetImage('images/ic_video_inactive_new.png') ,
                     height: 50,
                     width: 50,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage(
                                      text: 'Hello',
                                    )));
                      },
                      child: Text("Next Screen"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ThirdPage()));
                      },
                      child: Text("Third Screen"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ListViewPage()));
                      },
                      child: Text("ListView Screen"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TabView()));
                      },
                      child: Text("Tab View",
                      style: TextStyle(
                        fontFamily: 'DancingScript',
                      ),),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Hello worled",
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                        ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SharedPreferencePage()));
                      },
                      child: Text("Shared Preference",
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NavigationDrawerPage()));
                      },
                      child: Text("Navigation Drawer",
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ImagePickerPage()));
                      },
                      child: Text("Image Picker",
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WebViewPage()));
                      },
                      child: Text("Web View",
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SampleApiCallPage()));
                      },
                      child: Text("Api Call",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                       /* showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context),
                        );*/
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CustomDialogBox(title: 'Custom Dialog', text: 'Test text for custom dialog', descriptions: 'Test Title for custom dialog', img: Image(image: AssetImage('images/ic_video_inactive_new.png')),)));
                      },
                      child: Text("Custom Pop Up",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                         showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context),
                        );
                      },
                      child: Text("Pop Up",
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
