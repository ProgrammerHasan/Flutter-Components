import 'package:flutter/material.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;
  final bool isEnable;
  final bool isAutoFocus;
  PasswordTextFormFieldWidget({Key key, @required this.hint, @required this.controller, this.color,this.isEnable,this.isAutoFocus=false}) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() => _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends State<PasswordTextFormFieldWidget> {
  bool _passwordVisible = false;
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
      autofocus: widget.isAutoFocus,
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible,//This will obscure text dynamically
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
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      controller: widget.controller,
        validator: (value) =>
        value.isEmpty ? 'Please enter password' : null
    );
  }
}
