import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String name;
  final String image;

  const UserPage({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(name),
        centerTitle: true,
      ),
      body: Image.network(
        image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}
