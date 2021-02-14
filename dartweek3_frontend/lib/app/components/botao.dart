import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final Color buttonColor;
  final String label;
  final TextStyle textStyle;
  final Color labelColor;
  final double labelSize;

  const Botao({
    Key key,
    this.onPressed,
    this.width,
    this.height,
    this.buttonColor,
    this.label,
    this.textStyle,
    this.labelColor,
    this.labelSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: RaisedButton(
        onPressed: this.onPressed,
        color: this.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          this.label,
          style: this.textStyle ??
              TextStyle(
                fontSize: labelSize,
                color:labelColor,
              ),
        ),
      ),
    );
  }
}
