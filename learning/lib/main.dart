import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'PatrikeyCoderCoursLearning'),
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
  int _likes=0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addLikes(){
    setState(() {
      _likes++;
    });
  }

  void _reduceLikes(){
    setState(() {
      _likes--;
    });
  }
  void _reset(){
    setState(() {
      _likes=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            const SizedBox(height: 30, child: Card(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                    _addLikes();
                },
                icon: Icon(Icons.heart_broken_rounded, color: Colors.blueAccent, size: 35,),
                ),
                Text('$_likes', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){
                  _reduceLikes();
                },
                  icon: Icon(Icons.heart_broken_rounded, color: Colors.deepOrange, size: 35,),
                ),
              ],
            ),

            const SizedBox(height: 70, child: Card(),),

            TextButton(onPressed: (){
                _reset();
            }, child: Text('Reset', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green,),),
            ),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
