import 'package:feature_toggle_admin/model/rule.dart';

class SiteIdInListRule implements Rule {
  List<String> siteIds;

  SiteIdInListRule({this.siteIds});

  Map<String, dynamic> toJson() => {
        'type': 'SiteIdInListRule',
        'siteIds': siteIds,
      };
}
