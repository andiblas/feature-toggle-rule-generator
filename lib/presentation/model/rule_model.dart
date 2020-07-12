import 'package:feature_toggle_admin/model/rule.dart';
import 'package:flutter/material.dart';

class RuleModel extends ChangeNotifier {
  Rule ongoingRule;

  void changeRule(Rule newRule) {
    ongoingRule = newRule;
    notifyListeners();
  }

  void cleanRule() {
    ongoingRule = null;
    notifyListeners();
  }
}
