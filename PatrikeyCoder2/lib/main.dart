import 'package:flutter/material.dart';

void main(){
  runApp(const SappStatless());
}

class SappStatless extends StatelessWidget {
  const SappStatless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New feads',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('PatrickeyCoder Cours'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SappHome(),
      ),
    );
  }
}
class SappHome extends StatefulWidget {
  @override
  _SappHomeState createState() => _SappHomeState();
}
class _SappHomeState extends State<SappHome> {

  /*              SWITCH AND SLIDER             */
  bool val1 = false;
  String state1='OFF';
  double val3= 0.0;
  double state3 = 0.0;
  int state33=1;
  void change1(s){
    setState(() {
      val1=s;
      if(val1){
        state1='ON';
      }else{
        state1='OFF';
      }
    });
  }
  void change3(t){
    setState(() {
      val3=t;
      state3=val3*100;
      state33=state3.toInt();
    });
  }


  /*              TextField             */



  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child:Center(
          child: Column(

            children: [

              SizedBox(height: 50,),
              Column(
                children: [
                  Text('Switch and Slider', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Switch(value: val1, onChanged: change1,),
                          Text('$state1'),
                        ],
                      ),

                      Column(
                        children: [
                          Slider(value: val3, onChanged: change3,),
                          Text('$state33'),
                        ],
                      ),
                    ],
                  ),
                ],
              ), //Switch and Slider

              SizedBox(height: 50,),
              Column(
                children: [
                  Text('TextField', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText:'Nom Prénom',
                          hintText: 'Entrez votre nom et votre prénom',
                          icon: Icon(Icons.person, color: Colors.teal,size: 50,),
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          labelText:'Date de naisssance',
                          hintText: 'jj/mm/aaaa',
                          icon: Icon(Icons.date_range, color: Colors.teal,size: 50,),
                        ),
                        keyboardType: TextInputType.datetime,
                        autocorrect: true,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          labelText:'CNI',
                          hintText: '*********',
                          icon: Icon(Icons.credit_card_rounded, color: Colors.teal,size: 50,),
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: true,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          labelText:'Téléphone',
                          hintText: '+229 ** ** ** **',
                          icon: Icon(Icons.date_range, color: Colors.teal,size: 50,),
                        ),
                        keyboardType: TextInputType.phone,
                        autocorrect: true,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          labelText:'Email',
                          hintText: 'example@gmail.com',
                          icon: Icon(Icons.alternate_email_outlined, color: Colors.teal,size: 50,),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: true,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        obscureText:true,
                        decoration: InputDecoration(
                          labelText:'Mot de Passe',
                          hintText: "Veuillez entrer un mot de passe d'au moins 8 caractères" ,
                          icon: Icon(Icons.lock_outlined, color: Colors.teal,size: 50,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


            ],

          ),// All
        ),
      ),

    );
  }
}