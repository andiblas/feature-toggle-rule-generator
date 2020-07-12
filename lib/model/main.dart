import 'dart:convert';

import 'package:feature_toggle_admin/model/and_rule.dart';
import 'package:feature_toggle_admin/model/not_rule.dart';
import 'package:feature_toggle_admin/model/or_rule.dart';
import 'package:feature_toggle_admin/model/percentage_user_id_rule.dart';
import 'package:feature_toggle_admin/model/rule.dart';
import 'package:feature_toggle_admin/model/site_id_in_list_rule.dart';
import 'package:feature_toggle_admin/model/user_id_in_list_rule.dart';

void main() {
  print("Hello from Dart");

  var userList = UserIdInListRule(userList: [1, 2, 3, 4]);
  var siteList = SiteIdInListRule(siteIds: ["MLA", "MLB"]);
  var percentage = PercentageUserIdRule(percentage: 50);
  Rule andRule = AndRule(and: [userList, siteList]);
  Rule orRule = OrRule(or: [userList, percentage]);
  Rule notRule = NotRule(not: percentage);

  print(jsonEncode(userList));
  print(jsonEncode(siteList));
  print(jsonEncode(percentage));
  print(jsonEncode(andRule));
  print(jsonEncode(orRule));
  print(jsonEncode(notRule));
}
