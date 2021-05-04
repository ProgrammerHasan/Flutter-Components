import 'package:flutter/material.dart';


class CircleAvatarNumberComponent extends StatelessWidget {
  CircleAvatarNumberComponent(this.data);

  final int data;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(data.toString(),style: TextStyle(color: Colors.white),),backgroundImage: AssetImage('your asset'),backgroundColor: Colors.transparent,);
  }
}
