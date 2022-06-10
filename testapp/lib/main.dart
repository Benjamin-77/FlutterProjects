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

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
                width: 99,
                height: 34,
                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 99,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow : [BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0,0),
                                    blurRadius: 4
                                )],
                                color : Color.fromRGBO(35, 122, 191, 1),
                              )
                          )
                      ),Positioned(
                          top: 3,
                          left: 32,
                          child: Text('OK', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Ubuntu',
                              fontSize: 24,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),
                    ]
                )
            ),
            // Figma Flutter Generator NosservicesWidget - GROUP
            Container(
                width: 482,
                height: 58,

                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 482,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(200),
                                  bottomRight: Radius.circular(200),
                                ),
                                color : Color.fromRGBO(35, 122, 191, 1),
                                border : Border.all(
                                  color: Color.fromRGBO(34, 122, 191, 1),
                                  width: 5,
                                ),
                              )
                          )
                      ),Positioned(
                          top: 17,
                          left: 170,
                          child: Text('Nos Services', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Ubuntu',
                              fontSize: 24,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),
                    ]
                )
            ),
            // Figma Flutter Generator ServiceWidget - GROUP
            Container(
                width: 179,
                height: 154,

                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 179,
                              height: 154,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                boxShadow : [BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0,2),
                                    blurRadius: 2
                                )],
                                color : Color.fromRGBO(255, 255, 255, 1),
                                border : Border.all(
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  width: 7,
                                ),
                              )
                          )
                      ),Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 179,
                              height: 112,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                color : Color.fromRGBO(255, 255, 255, 1),
                                border : Border.all(
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  width: 3,
                                ),
                                image : DecorationImage(
                                    image: AssetImage('assets/images/Rectangle158.png'),
                                    fit: BoxFit.fitWidth
                                ),
                              )
                          )
                      ),Positioned(
                          top: 122,
                          left: 0,
                          child: Text('Chirurgie', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Zen Maru Gothic',
                              fontSize: 16,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),
                    ]
                )
            ),
            // Figma Flutter Generator DocteurWidget - GROUP
            Container(
                width: 232,
                height: 70,

                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                border : Border.all(
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  width: 5,
                                ),
                                image : DecorationImage(
                                    image: AssetImage('assets/images/Ellipse3.png'),
                                    fit: BoxFit.fitWidth
                                ),
                                borderRadius : BorderRadius.all(Radius.elliptical(70, 70)),
                              )
                          )
                      ),Positioned(
                          top: 0,
                          left: 102,
                          child: Container(
                              width: 130,
                              height: 55,

                              child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Text('Esther Howard', textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Zen Maru Gothic',
                                            fontSize: 20,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),Positioned(
                                        top: 35,
                                        left: 0,
                                        child: Text('+65 0043 3540', textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(22, 149, 57, 1),
                                            fontFamily: 'Zen Maru Gothic',
                                            fontSize: 14,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1
                                        ),)
                                    ),
                                  ]
                              )
                          )
                      ),
                    ]
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
