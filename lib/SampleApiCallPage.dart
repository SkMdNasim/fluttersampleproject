import 'dart:convert';
import 'dart:developer';

import 'package:firtstproj/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SampleApiCallPage extends StatefulWidget {
  const SampleApiCallPage({Key? key}) : super(key: key);

  @override
  _SampleApiCallPageState createState() => _SampleApiCallPageState();
}

Future<String> fetchUsers() async {
  // return http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users?page=2'));

  return response.body;
}
Future<List<User>> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users?page=2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //var data =jsonDecode(response.body);
    final Map parsed = json.decode(response.body);
    //final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    final data = parsed['data'];
     var userlist = data.map<User>((json) => User.fromJson(json)).toList();
    log('data: $userlist');
    //var datas = parsePhotos(response.body.toString());
    //log('data: $datas');

    return userlist;


  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

List<User> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  final data = parsed['data'];

  return data.map<User>((json) => User.fromJson(json)).toList();
}
class _SampleApiCallPageState extends State<SampleApiCallPage> {

  late Future<List<User>> featureuser;

  @override
  void initState() {
    super.initState();
    featureuser = fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: featureuser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //return Text(snapshot.data!.length.toString());
              return PhotosList(photos: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<User> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.network(photos[index].avatar, height: 100, width: 100,),
            Text(photos[index].first_name +" " + photos[index].last_name)
          ],
        );
      },
    );
  }
}
