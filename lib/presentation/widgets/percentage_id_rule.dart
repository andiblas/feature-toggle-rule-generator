import 'package:feature_toggle_admin/model/percentage_user_id_rule.dart';
import 'package:feature_toggle_admin/presentation/model/rule_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageIdCard extends StatefulWidget {
  PercentageIdCard({Key key}) : super(key: key);

  @override
  _PercentageIdCardState createState() => _PercentageIdCardState();
}

class _PercentageIdCardState extends State<PercentageIdCard> {
  PercentageUserIdRule _percentageUserIdRule =
      PercentageUserIdRule(percentage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text("User Id Percentage Rule"),
              subtitle:
                  Text("Please provide the desired percentage of the User Id."),
              trailing: Icon(Icons.perm_contact_calendar),
            ),
            Divider(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Slider(
                        value: _percentageUserIdRule.percentage.toDouble(),
                        max: 100,
                        min: 0,
                        onChanged: _onChanged,
                      ),
                    ),
                    Expanded(
                        child: Text("${_percentageUserIdRule.percentage}%")),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _onChanged(double value) {
    final newRule = PercentageUserIdRule(percentage: value.toInt());
    setState(() {
      _percentageUserIdRule = newRule;
    });
    final ruleModel = Provider.of<RuleModel>(context);
    ruleModel.changeRule(newRule);
  }
}
