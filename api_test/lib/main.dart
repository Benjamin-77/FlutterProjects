import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class users {
  String? firstname;
  String? lastname;
  String? adress;
  String? phone;
  String? gender;
  String? picture;
  String? citation;

  users(
      {this.firstname,
        this.lastname,
        this.adress,
        this.phone,
        this.gender,
        this.picture,
        this.citation});

  users.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    adress = json['adress'];
    phone = json['phone'];
    gender = json['gender'];
    picture = json['picture'];
    citation = json['citation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['picture'] = this.picture;
    data['citation'] = this.citation;
    return data;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count =4;

  List<users> userss = [];

  void _getAlbums() async {

    final response = await http.get(Uri.parse('https://ifri.raycash.net/getusers'));

      var jsons = json.decode(response.body);

      for (var i in jsons['message']) {
        setState(() {
          count++;
        });
        setState(() {
          userss.add(users.fromJson(i));
        });
      }

  }



  @override
  void initState() {
    super.initState();
    _getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: userss.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Titre : "+userss[index].picture!),
                SizedBox(height:40),
              ],
            );
          }),
      );
  }
}
