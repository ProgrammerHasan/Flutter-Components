import 'package:flutter/material.dart';
import 'package:flutter_components/components/ms_accordian.dart';
import 'package:flutter_components/components/circle_avatar_number.dart';

class ExampleMSAccordian extends StatefulWidget {
  @override
  _ExampleMSAccordianState createState() => _ExampleMSAccordianState();
}

class _ExampleMSAccordianState extends State<ExampleMSAccordian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accordian Example')),
      body: MsAccordion(
        titleChild: ListTile(
          leading:Transform(
            transform: Matrix4.translationValues(-12, 0.0, 0.0),
            child: CircleAvatarNumberComponent(1),
          ),
          title:Transform(
            transform: Matrix4.translationValues(-12, 0.0, 0.0),
            child: Text('Accordian'),
          ),
        ),
        showAccordion: false,
        margin: const EdgeInsets.all(0),
        expandedTitleBackgroundColor: Colors.blueGrey.withOpacity(0.3),
        collapsedTitleBackgroundColor: Colors.white10,
        contentBackgroundColor: Colors.white,
        contentChild: Column(
          children: <Widget>[
            // your children
          ],
        ),
      ),
    );
  }
}
