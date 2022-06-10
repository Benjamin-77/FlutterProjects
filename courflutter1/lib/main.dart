import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Cours Flutter'),
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
  int _selectedIndex = 0;
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  String? _gender;
  bool? _sport = false;
  bool? _music = false;
  bool? _lecture = false;
  bool? _science = false;
  bool? _cinema = false;
  bool? _sorties = false;

  bool _sportShow = false;
  bool _musicShow = false;
  bool _lectureShow = false;
  bool _scienceShow = false;
  bool _cinemaShow = false;
  bool _sortiesShow = false;

  final formKey = new GlobalKey<FormState>();
  String _name = "Benjamin MOUTOUAMA";
  bool _submitButtonShow = true;
  bool _loading = false;
  bool _displayInfo = false;

  void _resetForm(){
    setState(() {
      _displayInfo = false;
      _sport = false;
      _music = false;
      _lecture = false;
      _science = false;
      _cinema = false;
      _sorties = false;
      _nameController = TextEditingController();
      _passwordController = TextEditingController();
      _gender=null;
    });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text("Êtes-vous sûr de vouloir soumettre le formulaire ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Cancel");
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, "OK");
                    setState(() {
                      _submitButtonShow = false;
                      _loading = true;
                    });
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        _loading = false;
                        _submitButtonShow = true;
                        _name = _nameController.text;
                        _displayInfo = true;
                      });
                    });
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TP Cours Flutter',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mes notifications')));
            },
            icon: Icon(Icons.add_alert),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Faire une recherche')));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),

      drawer: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 250,
            height: 682,
            child: Drawer(
              child: ListView(
                children: [
                  Container(
                    height: 65,
                    child: DrawerHeader(
                      decoration: BoxDecoration(color: Colors.pink),
                      child: Text(
                        _name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Message'),
                  ),
                  ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text('Profil'),
                  ),
                  ListTile(
                    title: Text('Setting'),
                    leading: Icon(Icons.settings),
                  ),
                  ListTile(
                    title: Text('Déconnexion'),
                    leading: Icon(Icons.logout),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Inscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètre',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetForm();
        },
        tooltip: 'Reset',
        child: const Icon(Icons.replay_sharp),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Information de l'utilisateur",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(height: 35.0),
              Center(
                child: SvgPicture.asset(
                  "assets/images/user.svg",
                  height: 70,
                ),
              ),
              /*Center(
                child: Image(image: AssetImage('assets/images/ut.png')),
              ),*/
              SizedBox(height: 30),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.teal,
                        ),
                        hintText: 'Entrez votre nom ici',
                        labelText: 'Nom et Prénom',
                      ),
                      validator: (String? value) {
                        return (value == null || value == " ")
                            ? "Ce champ est obligatoire"
                            : null;
                      },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            size: 40,
                            color: Colors.teal,
                          ),
                          hintText: 'Définir un mot de passe',
                          labelText: 'Mot de passe'),
                      validator: (String? value) {
                        return (value == null || value == "")
                            ? "Ce champ est obligatoire"
                            : null;
                      },
                    ),
                    SizedBox(height: 30),
                    DropdownButtonFormField(
                      style: TextStyle(color: Colors.blue),
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.transgender,
                          size: 40,
                          color: Colors.teal,
                        ),
                        hintText: 'Quel est votre sexe',
                        labelText: "Sexe *",
                      ),
                      value: _gender,
                      onChanged: (String? v) {
                        setState(() {
                          _gender = v;
                        });
                      },
                      items: <String>['Homme', 'Femme', 'Autre']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      validator: (str) =>
                          str == null ? "Ce champ est obligatoire" : null,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quels sont vos passe temps préférés ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _sport,
                            onChanged: (bool? b) {
                              setState(() {
                                _sport = b;
                                if (b == null || b == false) {
                                  _sportShow = false;
                                } else {
                                  _sportShow = true;
                                }
                              });
                            }),
                        Text('Sport'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _music,
                            onChanged: (bool? b) {
                              setState(() {
                                _music = b;
                                if (b == null || b == false) {
                                  _musicShow = false;
                                } else {
                                  _musicShow = true;
                                }
                              });
                            }),
                        Text('Musique'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _cinema,
                            onChanged: (bool? b) {
                              setState(() {
                                _cinema = b;
                                if (b == null || b == false) {
                                  _cinemaShow = false;
                                } else {
                                  _cinemaShow = true;
                                }
                              });
                            }),
                        Text('Mangas'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _lecture,
                            onChanged: (bool? b) {
                              setState(() {
                                _lecture = b;
                                if (b == null || b == false) {
                                  _lectureShow = false;
                                } else {
                                  _lectureShow = true;
                                }
                              });
                            }),
                        Text('Lecture'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _science,
                            onChanged: (bool? b) {
                              setState(() {
                                _science = b;
                                if (b == null || b == false) {
                                  _scienceShow = false;
                                } else {
                                  _scienceShow = true;
                                }
                              });
                            }),
                        Text('Science'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _sorties,
                            onChanged: (bool? b) {
                              setState(() {
                                _sorties = b;
                                if (b == null || b == false) {
                                  _sortiesShow = false;
                                } else {
                                  _sortiesShow = true;
                                }
                              });
                            }),
                        Text('Sorties'),
                      ],
                    ),
                  ],
                ),
              ), //CheckBox's
              SizedBox(height: 70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _submitButtonShow
                      ? ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _displayDialog(context);
                            }
                          },
                          child: Text('Envoyer'))
                      : SizedBox(),
                  SizedBox(height: 5.0),
                  _loading
                      ? CircularProgressIndicator(
                          color: Colors.pink,
                        )
                      : SizedBox(),
                ],
              ), // Validation
              SizedBox(
                height: 10,
              ),
              _displayInfo
                  ? Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.pink,
                            ),
                            title: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '\n $_name \n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ' $_gender',
                                      style: TextStyle(color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Passe temps",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _sportShow
                                    ? Text("• Sport",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                SizedBox(
                                  height: 5,
                                ),
                                _musicShow
                                    ? Text("• Musique",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                SizedBox(
                                  height: 5,
                                ),
                                _cinemaShow
                                    ? Text("• Cinéma",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                SizedBox(
                                  height: 5,
                                ),
                                _lectureShow
                                    ? Text("• Lecture",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                SizedBox(
                                  height: 5,
                                ),
                                _scienceShow
                                    ? Text("• Science",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                SizedBox(
                                  height: 5,
                                ),
                                _sortiesShow
                                    ? Text("• Sorties",
                                        style: TextStyle(color: Colors.black54))
                                    : SizedBox(),
                                Row(),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("Ajouter")),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("Supprimer")),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
