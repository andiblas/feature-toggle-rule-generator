import 'package:feature_toggle_admin/model/rule.dart';

class UserIdInListRule implements Rule {
  List<double> userList;

  UserIdInListRule({this.userList});

  Map<String, dynamic> toJson() => {
        'type': 'UserIdInListRule',
        'userIds': userList,
      };
}
