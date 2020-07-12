import 'dart:ui';

import 'package:feature_toggle_admin/model/rule.dart';
import 'package:feature_toggle_admin/model/site_id_in_list_rule.dart';
import 'package:feature_toggle_admin/presentation/model/rule_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SiteIdInListCard extends StatefulWidget {
  SiteIdInListCard({Key key}) : super(key: key);

  @override
  _SiteIdInListCardState createState() => _SiteIdInListCardState();
}

class _SiteIdInListCardState extends State<SiteIdInListCard> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: Text("Site Id in List Rule"),
                subtitle: Text(
                    "Please provide the Site Id's that apply for the rule."),
                trailing: Icon(Icons.domain),
              ),
              Divider(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: _validateInput,
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontFamily: "Courier New"),
                    onChanged: _onChanged,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  final regexp = RegExp(r'^([A-Za-z]{3})[,]{0,1}\n{0,1}',
      caseSensitive: false, multiLine: true);

  String _validateInput(String value) {
    if (regexp.allMatches(value).isEmpty) {
      return 'The input is invalid. Only Site Id in a list are accepted.';
    }
    return null;
  }

  void _onChanged(String value) {
    final ruleModel = Provider.of<RuleModel>(context);
    if (_formKey.currentState.validate()) {
      var newRule = _buildRuleFromInput(value);
      ruleModel.changeRule(newRule);
    }
  }

  Rule _buildRuleFromInput(String value) {
    var siteIds =
        regexp.allMatches(value).map((match) => match.group(1)).toList();
    return SiteIdInListRule(siteIds: siteIds);
  }
}
