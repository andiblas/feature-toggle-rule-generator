import 'package:feature_toggle_admin/model/rule.dart';

class AndRule implements Rule {
  List<Rule> and;

  AndRule({this.and});

  Map<String, dynamic> toJson() => {
        'type': 'AndRule',
        'and': and,
      };
}
