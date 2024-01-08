import 'package:flutter/material.dart';

class WidgetErrorTextSmall extends StatelessWidget {

  final String errorMessage;
  final bool isVisible;
  const WidgetErrorTextSmall(this.errorMessage, this.isVisible,{super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Visibility(
          visible: isVisible,
          child: Text(
            errorMessage,
            style: TextStyle(
                color: Colors.red[700],
                fontSize: 12),
          )),
    );
  }
}
