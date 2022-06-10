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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'SappMobile'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void _reinitialiser() {
    setState(() {

      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        actions: [

          IconButton(onPressed: (){

          }, icon: Icon(Icons.notifications_on)),

        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10,),
            Container(
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0)
                  ),
                ],
                color: Colors.yellow,
              ),
              child: const Text('Portefeuille'),
            ),
            const SizedBox(height: 30,),
            const Text(
              'Solde:',
            ),
            Text(
              '$_counter \$',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 70,),
            ElevatedButton(onPressed: (){
                _reinitialiser();
            }, child: Text('Réinitialiser') ),

            const SizedBox(height: 350,),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
