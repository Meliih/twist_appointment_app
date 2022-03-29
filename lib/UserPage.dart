import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CircleAvatar(
                        backgroundImage: new AssetImage("image/girl.png"),
                        radius: 31.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "ömer bababbababab",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(19)),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.purple,
                        ),
                        labelText: "Ad",
                        enabledBorder: InputBorder.none,
                        labelStyle: const TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.purple,
                        ),
                        labelText: "Soyad",
                        enabledBorder: InputBorder.none,
                        labelStyle: const TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.mail_outline,
                          color: Colors.purple,
                        ),
                        labelText: "Email",
                        enabledBorder: InputBorder.none,
                        labelStyle: const TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.monitor_weight_outlined,
                          color: Colors.purple,
                        ),
                        labelText: "Kilo",
                        enabledBorder: InputBorder.none,
                        labelStyle: const TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.purple,
                        ),
                        labelText: "Boy",
                        enabledBorder: InputBorder.none,
                        labelStyle: const TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
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