import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'SharedPreference'),
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
  final _formKey = GlobalKey<FormState>();
  var _firtNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 120,
                  color: Colors.deepOrange,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _firtNameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            size: 35,
                            color: Colors.deepOrange,
                          ),
                          hintText: 'Entrez votre nom ici',
                          labelText: 'Nom',
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _lastNameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            size: 35,
                            color: Colors.deepOrange,
                          ),
                          hintText: 'Entrez votre Prénom ici',
                          labelText: 'Prénom',
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _professionController,
                        autocorrect: true,
                        obscureText: true,
                        obscuringCharacter: '*',
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.work,
                            size: 35,
                            color: Colors.deepOrange,
                          ),
                          hintText: 'Quelle est votre profession ?',
                          labelText: 'Profession',
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("firstname", _firtNameController.text);
                      prefs.setString("lastname", _lastNameController.text);
                      prefs.setString("profession", _professionController.text);

                      Fluttertoast.showToast(
                          msg: "Enrégistrement Réussi !!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM);
                    }
                  },
                  child: Text("Valider"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InfoPage()),
                    );
                  },
                  child: Text("Page suivante ->"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String _firstname = "";
  String _lastname = "";
  String _profession = "";

  _loadInformation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstname = prefs.getString("firstname") ?? "";
      _lastname = prefs.getString("lastname") ?? "";
      _profession = prefs.getString("profession") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(((_) => _loadInformation()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreference"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 120,
                color: Colors.deepOrange,
              ),

              SizedBox(height: 70,),

              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black87),
                      children: [
                    TextSpan(
                      text: "Je soussigné : ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: _lastname + " " + _firstname,
                      style: TextStyle(fontSize: 25),
                    ),
                    TextSpan(
                      text: "\n\nProfession : ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: _profession,
                      style: TextStyle(fontSize: 25),
                    ),
                  ])),
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: "SharedPreference")),
                  );
                },
                child: Text("<- Retour"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
