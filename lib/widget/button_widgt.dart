import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final int? size;
  final VoidCallback? onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key? key, this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(
          text!,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
          primary: Colors.blue.shade900,
          padding: EdgeInsets.all(15),
          textStyle: TextStyle(color: Colors.white,),
        ),
        onPressed: onClicked,
      );
}