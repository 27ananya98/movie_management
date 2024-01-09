import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });
  double h=0.0;
  double w=0.0;

  @override
  Widget build(BuildContext context) {
      w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return  AlertDialog(
      title: Text(
        this.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        // style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}