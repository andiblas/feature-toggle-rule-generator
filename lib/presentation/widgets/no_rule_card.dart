import 'package:flutter/material.dart';

class NoRuleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Please, start adding a rule",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
