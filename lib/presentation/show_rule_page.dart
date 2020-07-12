import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/rule_model.dart';

class ShowRulePage extends StatelessWidget {
  const ShowRulePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Result"),
        elevation: 0,
      ),
      body: Center(
        child: Consumer<RuleModel>(
          builder: (context, ruleModel, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildRuleShow(context, ruleModel),
            );
          },
        ),
      ),
    );
  }

  Widget buildRuleShow(BuildContext context, RuleModel ruleModel) {
    if (ruleModel.ongoingRule == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No rule could be built =(...",
            style: Theme.of(context).textTheme.headline5,
          ),
          Icon(
            Icons.mood_bad,
            size: 48.0,
          )
        ],
      );
    } else {
      final ruleJson = jsonEncode(ruleModel.ongoingRule);
      return Column(
        children: [
          SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: ruleJson,
                    style: TextStyle(fontFamily: "Courier New")),
              ],
            ),
          ),
          RaisedButton(
            child: Icon(Icons.content_copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: ruleJson));
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Content copied!")));
            },
          )
        ],
      );
    }
  }
}
