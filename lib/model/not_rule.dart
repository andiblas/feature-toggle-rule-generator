import 'package:feature_toggle_admin/model/rule.dart';

class NotRule implements Rule {
  Rule not;

  NotRule({this.not});

  Map<String, dynamic> toJson() => {
        'type': 'NotRule',
        'not': not,
      };
}
