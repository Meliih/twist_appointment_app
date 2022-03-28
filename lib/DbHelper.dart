import 'package:flutter/material.dart';

class DbHelper{

  List<Trainer> Trainers (){

    Trainer trainer = Trainer(1,"image/woman.png","Çağla Öner","5.0","",[1,2]);
    Trainer trainer2 = Trainer(2,"image/girl.png","Zeliha ","5.0","",[1]);
    Trainer trainer3 = Trainer(3,"image/woman.png","Kadriye","5.0","",[1]);
    Trainer trainer4 = Trainer(4,"image/woman.png","Mine","5.0","",[1]);
    Trainer trainer5 = Trainer(5,"image/woman.png","Sibel","5.0","",[2,1]);

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

  Category(this.id, this.img, this.name, this.trainerCount);
}

class Trainer {
  late int id;
  late String img;
  late String name;
  late String rating;
  late String domain;
  late List<int> category_id;

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


}