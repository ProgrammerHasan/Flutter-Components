import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;
  final bool isEnable;
  final bool isAutoFocus;

  TextFieldComponent({Key key, @required this.hint, @required this.controller, this.color,this.isEnable,this.isAutoFocus=false}) : super(key: key);

  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();

}

class _TextFieldComponentState extends State<TextFieldComponent> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text == 'null') {
        widget.controller.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnable??true,
      style: TextStyle(
          fontSize: 14
      ),
      keyboardType: TextInputType.text,
      autofocus: widget.isAutoFocus,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.red),
        focusColor: Colors.grey[700],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[700],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[700],
            width: 1.0,
          ),
        ),
        labelText: widget.hint,
        labelStyle: TextStyle(
          color: widget.color??Colors.grey[700],
        ),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 8, right: 8),
      ),
      controller: widget.controller,
      validator: (value) =>
      value.isEmpty ? 'Please enter password' : null
    );
  }
}
