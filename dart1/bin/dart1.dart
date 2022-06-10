import 'dart:io';

import 'Femme.dart';
import 'Person.dart';

void main(List<String> arguments) {
  Person r=Person.parametre("MOUTOUAMA", "Benjamin");
  String a=r.getNom();
  print(a);
  Femme fille=Femme();
  print(fille.getNom());
  stdout.write("Nom :");
  var nom= stdin.readLineSync();
  stdout.write("Prénom :");
  var prenom= stdin.readLineSync();
  stdout.write("Àge :");
  var age= stdin.readLineSync();
  stdout.write("Née à :");
  var villeNaissance= stdin.readLineSync();
  stdout.write("Ville de Résidence :");
  var residence= stdin.readLineSync();
  stdout.write("Quelle table de multiplication vous maîtrisez le mieux ? :");
  var multiplication= stdin.readLineSync();

  print(presentation(nom, prenom, age, villeNaissance, residence, multiplication));
}

String presentation(var nom, var prenom, var age, var ville, var residence, var multiple){
  String texte="Je m'appelle $prenom $nom. J'ai $age ans, j'ai grandi à $ville et je réside actuellement à $residence pour la poursuite de mes études universitaire. \n je sais même dresser la table de multiplication de $multiple ☺ :";
  /*for(var i in tableMultiplication(multiple)){
    texte=texte+i.toString();
  }*/
  return texte;
}

List tableMultiplication(var nbr){
  List table=[];
  for(var i=0;i<=12;i++){
    var result = i*nbr;
    String fin = "\n $nbr*$i = result";
    table.add(fin);
  }
  return table;
}
