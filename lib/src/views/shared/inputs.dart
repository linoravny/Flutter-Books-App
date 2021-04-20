import 'package:flutter/material.dart';

class SharedInputs {
  InputDecoration sharedInputDecoration({
    bool isRound = true,
    bool hasOutLineBorder = true,
    String labelText,
    IconData prefixIcon,
    TextStyle labelStyle,
  }) {
    return InputDecoration(
      labelText: labelText != null ? labelText : '',
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      labelStyle: labelStyle != null
          ? labelStyle
          : TextStyle(
              color: Colors.black,
            ),
      border: hasOutLineBorder
          ? OutlineInputBorder(
              borderRadius: isRound
                  ? BorderRadius.all(
                      Radius.circular(10.0),
                    )
                  : BorderRadius.all(Radius.circular(0)),
            )
          : null,
    );
  }
}
