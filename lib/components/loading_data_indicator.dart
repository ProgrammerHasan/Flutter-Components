import 'package:flutter/material.dart';

class LoadingDataIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 45,
          width: 45,
          child: CircularProgressIndicator()
      ),
    );
  }
}
