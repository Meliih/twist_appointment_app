import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twist_appointment_app/HomePage.dart';
import 'package:twist_appointment_app/Login/ForgetPassword.dart';

import 'Signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

bool isHidden = false;

class _LoginPage extends State<LoginPage> {
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
                  color: Colors.purple),
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
                  color: Colors.purple),
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
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.email,
                                color: Colors.purple,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              labelText: "Email",
                              hintText: "twistpilates@gmail.com",
                              enabledBorder: InputBorder.none,
                              labelStyle: const TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          obscureText: isHidden,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.purple,
                              ),
                              suffixIcon: IconButton(
                                icon: isHidden
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: togglePasswordVisibilty,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              labelText: "Şifre",
                              enabledBorder: InputBorder.none,
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ForgetPassword()));
                      },
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: const Text(
                            "Şifremi Unuttum?",
                            style: TextStyle(
                                color: Colors.black, fontSize: 15),
                          )),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("la oglum gelsene");
                          Navigator.push(
                              context,
                              //kontrol yapıcaz
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Colors.amber,
                                child: Center(
                                  child: Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.purple  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Aramıza Katılmak İstermisiniz ? ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        " Hesap Oluştur",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void togglePasswordVisibilty() => setState(() => isHidden = !isHidden);
}
