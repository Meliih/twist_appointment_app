import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUp();
}

bool isHidden = false;

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    double getSmallDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;
    double getBiglDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 7 / 8;


    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.pinkAccent,Colors.purple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBiglDiameter(context) / 4,
            top: -getBiglDiameter(context) / 4,
            child: Container(
              child: const Center(
                child: Text(
                  "Twist",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.pink,Colors.purple ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBiglDiameter(context) / 2,
            bottom: -getBiglDiameter(context) / 2,
            child: Container(
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(19)),
                  margin: const EdgeInsets.fromLTRB(20, 230, 20, 10),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    children:  <Widget>[
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
                        obscureText: isHidden,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.purple,
                            ),
                            suffixIcon: IconButton(
                              icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                              onPressed:  togglePasswordVisibilty,
                            ),
                            labelText: "Şifre",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),

                      ),
                      Container(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      TextField(
                        obscureText: isHidden,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.purple,
                            ),
                            suffixIcon: IconButton(
                              icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                              onPressed:  togglePasswordVisibilty,
                            ),
                            labelText: "Şifrenizi Yeniden Giriniz",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),

                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.amber,
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "Kayıt Ol",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.purple,
                                    Color(0xFFFF4891)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  void togglePasswordVisibilty() => setState(() => isHidden = !isHidden);



}