
import 'package:flutter/material.dart';

class DefultBottom extends StatelessWidget {
  final double width;
  final Color background;
  final Function onpresse;
  final String text;

  const DefultBottom(
      {super.key,
        required this.width,
        required this.background,
        required this.onpresse,
        required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          onpresse();
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}








