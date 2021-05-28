import 'package:flutter/material.dart';

import 'package:ecommerce_app/View/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  String text, hint;
  Function onSave;
  Function validator;
  CustomTextFormField({
    this.text,
    this.hint,
    this.onSave,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CustomText(
          text: text,
          color: Colors.grey,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black,
              )),
        ),
      ]),
    );
  }
}
