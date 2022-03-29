import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DbHelper{

  void writeData(var trainer,){
    DatabaseReference reference = FirebaseDatabase.instance.reference().child("Category").child("2");
    reference.set(trainer);
  }

  void readData(){

  }

  List<Trainer> Trainers (){

    Trainer trainer = Trainer(1,"image/woman.png","Çağla Öner","5.0","",[1,2]);
    Trainer trainer2 = Trainer(2,"image/girl.png","Zeliha ","5.0","",[1]);
    Trainer trainer3 = Trainer(3,"image/woman.png","Kadriye","5.0","",[1]);
    Trainer trainer4 = Trainer(4,"image/woman.png","Mine","5.0","",[1]);
    Trainer trainer5 = Trainer(5,"image/woman.png","Sibel","5.0","",[2,1]);
    //writeData(trainer5.toMap());

    List<Trainer> trainers = List<Trainer>.filled(5, trainer);
    trainers[0] =trainer;
    trainers[1]=trainer2;
    trainers[2]=trainer3;
    trainers[3]=trainer4;
    trainers[4]=trainer5;


    return trainers;
  }

  List<Category> Categories(){
    Category category = Category(1,"image/2320765.png", "Pilates", 0);
    Category category1 = Category(2,"image/gymnastics.png", "Jimnastik", 0);
    List<Category> categories = List<Category>.filled(2, category);
    //writeData(category1.toMap());
    categories[0]=category;
    categories[1]=category1;

    return categories;
  }


}

class Category{
  late int id;
  late String img;
  late String name;
  late int trainerCount;

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      "id" : id,
      "name" : name,
      "img" : img,
      "trainerCount" : trainerCount,
    };
    return map;
  }

  Category.fromMap(Map<String, dynamic> jsonMap)
      : id = jsonMap["id"],
        name = jsonMap["name"],
        trainerCount = jsonMap["trainerCount"],
        img = jsonMap["img"];


  Category(this.id, this.img, this.name, this.trainerCount);
}

class Trainer {
  late int id;
  late String img;
  late String name;
  late String rating;
  late String domain;
  late List<int> category_id;

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      "id" : id,
      "name" : name,
      "img" : img,
      "rating" : rating,
      "domain" : domain,
      "categor_id" : category_id
    };
    return map;
  }

  Trainer(this.id, this.img, this.name, this.rating, this.domain,this.category_id);

}

class User {
  late int id;
  late String name;
  late String surname;
  late String img;
  late String password;
  late String email;
  late String userName;

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      "id" : id,
      "name" : name,
      "surname" : surname,
      "img" : img,
      "password" : password,
      "email" : email,
      "userName" : userName
    };
    return map;
  }

  User(this.id, this.name, this.surname, this.img, this.password, this.email,
      this.userName);
}