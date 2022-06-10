import 'Person.dart';

class Femme extends Person{
  Femme():super();
  Femme.parametre(String nom, String profession, {int age=1}):super.parametre(nom, profession,  age:age);
}