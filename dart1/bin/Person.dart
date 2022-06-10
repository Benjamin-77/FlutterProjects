class Person{
  late String nom;
  late String profession;
  late int age;

  Person (){
    this.nom="";
    this.profession="";
    this.age=1;
  }
  Person.parametre (String nom, String profession, {int age=1}){
    this.nom=nom;
    this.profession=profession;
    this.age=age;
  }

  String getNom(){
    return this.nom;
  }
}