import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function onPressed;
  final Stream<bool> isBusyController;
  final String label;

  SubmitButton({
    @required this.onPressed,
    @required this.isBusyController,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: StreamBuilder<bool>(
        stream: isBusyController,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            );
          }

          return Text(label);
        },
      ),
    );
  }
}
