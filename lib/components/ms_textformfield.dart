import 'package:flutter/material.dart';

class MsTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;
  final bool isEnable;
  final bool isAutoFocus;
  final bool isValidation;
  final bool isPhoneValidation;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  MsTextFormField({Key key, @required this.hint, @required this.controller, this.color,this.isEnable,this.isAutoFocus=false,this.isValidation=false,this.isPhoneValidation=false,this.textInputAction=TextInputAction.next,this.textInputType=TextInputType.text}) : super(key: key);

  @override
  _MsTextFormFieldState createState() => _MsTextFormFieldState();
}

class _MsTextFormFieldState extends State<MsTextFormField> {

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
      keyboardType: widget.textInputType,
      autofocus: widget.isAutoFocus,
      textInputAction: widget.textInputAction,
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
        validator: (String value) {
        if(widget.isValidation)
          {
            if(widget.isPhoneValidation) {
                return 'Please enter valid phone number';
            }else{
              if (value.isEmpty) {
                return 'Please enter '+widget.hint.toLowerCase();
              }
            }
            return null;
          }
          return null;
        },

    );
  }
}
