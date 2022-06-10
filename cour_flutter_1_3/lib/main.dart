import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';
import 'sql_helper.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        primarySwatch: Colors.red,
      ),
      home: const ListContactsPage(),
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
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();

  // Insert a new journal to the database
  Future<void> _addUser() async {
    await SQLHelper.createUser(_nameController.text, _phoneController.text);
  }

  // Update an existing journal
  Future<void> _updateUser(int id) async {
    await SQLHelper.updateUser(id, _nameController.text, _phoneController.text);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
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
                  color: Colors.red,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Ajouter un nouveau contact",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            size: 35,
                            color: Colors.black45,
                          ),
                          hintText: 'Entrez votre nom et vos prénoms ici',
                          labelText: 'Nom et Prénom',
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
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        autocorrect: true,
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone_in_talk_outlined,
                            size: 35,
                            color: Colors.black45,
                          ),
                          hintText: '+299 ** ** ** **',
                          labelText: 'Téléphone',
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
                    _addUser();
                    Fluttertoast.showToast(
                      msg: "Enrégistrement Réussi",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                    );
                    _nameController.text = "";
                    _phoneController.text = "";

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListContactsPage()),
                    );

                  },
                  child: Text("Enrégistrer",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: 150,
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

/*  $$$$$$$$$$$$$$$$$ ListContactsPage  $$$$$$$$$$$$$$$$$*/
class ListContactsPage extends StatefulWidget {
  const ListContactsPage({Key? key}) : super(key: key);
  @override
  State<ListContactsPage> createState() => _ListContactsPageState();
}

class _ListContactsPageState extends State<ListContactsPage> {
  bool _isLoading = false;
  List<Map<String, dynamic>> _users = [];

  // This function is used to fetch all data from the database
  void _refreshUsers() async {
    final data = await SQLHelper.getUsers();
    setState(() {
      _users = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshUsers(); // Loading the diary when the app starts
  }


  @override
  Widget build(BuildContext context) {

    // Delete an item
    void _deleteItem(int id) async {
      await SQLHelper.deleteUser(id);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted a journal!'),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SQLite",
          style: TextStyle(color: Colors.white),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: "SQLite")));
        },
        label: const Text(
          'Nouveau contact',
        ),
        icon: const Icon(
          Icons.person_add_alt_1,
          size: 40,
        ),
        backgroundColor: Colors.red,
        extendedPadding: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
      ),
      
      body: _users.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text(_users[index]['name']),
                        subtitle: Text(_users[index]['telephone']),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Container(
                                            child: Text("Voulez vous vraiment supprimer cet contact ?"),
                                          ),
                                          actions: [
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.red,
                                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context, "OK");
                                                  _deleteItem(_users[index]['id']);
                                                  _refreshUsers();
                                                },
                                                child: const Text("Oui")),

                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.red,
                                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context, "Cancel");
                                                },
                                                child: const Text("Non")),
                                          ],
                                          content: Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                SizedBox(height: 40),
                                                Icon(Icons.person, size: 100,color: Colors.red,),
                                                SizedBox(height: 30,),
                                                Text(_users[index]['name']),
                                              ],
                                            ),
                                          ),
                                        );}
                                  );
                              },
                              child: Text(
                                "Supprimer",
                                style: TextStyle(color: Colors.red),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InfoPage(id: _users[index]['id'] ?? 0)));
                              },
                              child: Text(
                                "Détail",
                                style: TextStyle(color: Colors.red),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
          : Center(
              child: Text(
                "Aucune Données Disponible",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
    );
  }
}

/*  $$$$$$$$$$$$$$$$$ InfoPage  $$$$$$$$$$$$$$$$$*/
class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String _name = "";
  String _phoneNumber = "";
  bool _isLoading = false;

  List<Map<String, dynamic>> _user = [];

  // This function is used to fetch all data from the database
  void _refreshUsers() async {
    final data = await SQLHelper.getUser(widget.id);
    setState(() {
      _user = data;
      _isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(((_) => _refreshUsers()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SQLite",
          style: TextStyle(color: Colors.white),
        ),
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
                color: Colors.red,
              ),
              SizedBox(
                height: 70,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black87),
                      children: [
                    TextSpan(
                      text: "Name :  ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: _user[0]['name'],
                      style: TextStyle(fontSize: 25),
                    ),
                    TextSpan(
                      text: "\n\nPhone Number :  ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: _user[0]['telephone'],
                      style: TextStyle(fontSize: 25),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
