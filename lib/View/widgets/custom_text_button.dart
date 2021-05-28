import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Function onPressed;

  const CustomTextButton({this.text, this.imageUrl, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey)


      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Image.asset(imageUrl),
            SizedBox(
              width: 50,
            ),
            CustomText(
              text: text,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
