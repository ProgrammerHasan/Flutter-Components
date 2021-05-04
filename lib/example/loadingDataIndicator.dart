import 'package:flutter/material.dart';
import 'package:flutter_components/components/loading_data_indicator.dart';
import 'package:flutter_components/components/ms_accordian.dart';
import 'package:flutter_components/components/circle_avatar_number.dart';

class LoadingDataIndicatorExample extends StatefulWidget {
  @override
  _LoadingDataIndicatorExampleState createState() => _LoadingDataIndicatorExampleState();
}

class _LoadingDataIndicatorExampleState extends State<LoadingDataIndicatorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading Data Indicator Example')),
      body: LoadingDataIndicator(),
    );
  }
}
