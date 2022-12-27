import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hinttext,
    this.keyboardtype,
    required this.labeltext,
    this.maxlenght,
    this.textalign,
    this.obscuretext = false,
    this.fieldcontroller,
    this.suffixicon,
    this.prefixicon,
    this.counter,
    this.errorText,
  }) : super(key: key);

  final String labeltext;
  final String hinttext;
  final TextInputType? keyboardtype;
  final int? maxlenght;
  final TextAlign? textalign;
  final bool obscuretext;
  final TextEditingController? fieldcontroller;
  final IconButton? suffixicon;
  final Icon? prefixicon;
  final Offstage? counter;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        controller: fieldcontroller,
        obscureText: obscuretext,
        keyboardType: keyboardtype,
        maxLength: maxlenght,
        decoration: InputDecoration(
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            prefixIcon: prefixicon,
            suffixIcon: suffixicon,
            counter: counter,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hinttext,
            label: Text(labeltext)),
      ),
    );
  }
}
