import 'package:feature_toggle_admin/model/rule.dart';

class PercentageUserIdRule implements Rule {
  int percentage;

  PercentageUserIdRule({this.percentage});

  Map<String, dynamic> toJson() => {
        'type': 'PercentageUserIdRule',
        'user_percentage': percentage,
      };
}
