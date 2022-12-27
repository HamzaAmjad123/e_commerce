import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hinttext,
    this.keyboardtype,
    required this.labeltext,
    this.inputformatter,
    this.maxlenght,
    this.textalign,
    this.obscuretext = false,
    this.validator,
    this.fieldcontroller,
    this.suffixicon,
    this.prefixicon,
  }) : super(key: key);

  final String labeltext;
  final String hinttext;
  final TextInputType? keyboardtype;
  final int? maxlenght;
  final TextAlign? textalign;
  final bool obscuretext;
  final TextInputFormatter? inputformatter;
  final FormFieldValidator<String>? validator;
  final TextEditingController? fieldcontroller;
  final InkWell? suffixicon;

  final Icon? prefixicon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: fieldcontroller,
        validator: validator,
        obscureText: obscuretext,
        keyboardType: keyboardtype,
        maxLength: maxlenght,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          counter: const Offstage(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hinttext,
          label: Text(
            labeltext,
          ),
        ),
      ),
    );
  }
}
