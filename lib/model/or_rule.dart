import 'package:feature_toggle_admin/model/rule.dart';

class OrRule implements Rule {
  List<Rule> or;

  OrRule({this.or});

  Map<String, dynamic> toJson() => {
        'type': 'OrRule',
        'or': or,
      };
}
