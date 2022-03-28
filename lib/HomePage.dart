import 'package:flutter/material.dart';
import 'package:twist_appointment_app/CategoryTrainer.dart';
import 'package:twist_appointment_app/DbHelper.dart';
import 'package:twist_appointment_app/NavigationDrawer.dart';
import 'Doctor_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    List<Trainer> trainers = DbHelper().Trainers();
    List<Category> categories = DbHelper().Categories();
    for (int i = 0; i<categories.length;i++){
      for(int j = 0;j < trainers.length;j++){
        for (int k=0; k < trainers[j].category_id.length ; k++) {
          if(categories[i].id == trainers[j].category_id[k]) {
              categories[i].trainerCount++;
          }
        }
      }
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        //centerTitle: true,
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundImage:
                new AssetImage("image/girl.png"),
                radius: 22.0,
              ),

            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Merhaba, Melih",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        maxLines: 1,
                        autofocus: false,
                        style:
                            TextStyle(color: Color(0xff107163), fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Arama..',
                        ),
                        cursorColor: Color(0xff107163),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff107163),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Kategori',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Tümünü göster',
                        style: TextStyle(
                          color: Color(0xff5e5d5d),
                          fontSize: 19,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return demoCategories(trainers,categories[index]);
                  }
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Eğitmenler',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Tümünü göster',
                        style: TextStyle(
                          color: Color(0xff5e5d5d),
                          fontSize: 19,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(

                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                    itemCount: trainers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return demoTopRatedDr(context, trainers[index]);
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget demoCategories(List<Trainer> trainers,Category category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryTrainer(trainers:trainers,selectedCategory: category.id)));
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Color(0xff107163),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(category.img,height: 50),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                category.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Color(0xffd9fffa).withOpacity(0.07),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                category.trainerCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoTopRatedDr(BuildContext context,Trainer trainer) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DoctorDetailPage(trainer: trainer,)));
      },
      child: Container(
        height: 90,
        // width: size.width,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(trainer.img),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      trainer.name,
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          trainer.name,
                          style: TextStyle(
                            color: Color(0xffababab),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Rating: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  trainer.rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
