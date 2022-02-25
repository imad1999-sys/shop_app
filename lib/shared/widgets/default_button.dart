import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double btnWidth;
  final Color btnColor;
  final String btnText;
  final void Function()? function;

  const DefaultButton({
    required this.btnWidth,
    required this.btnColor,
    required this.btnText,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth,
      color: btnColor,
      child: MaterialButton(
        onPressed: function,
        child: Text(btnText.toUpperCase()),
      ),
    );
  }
}
