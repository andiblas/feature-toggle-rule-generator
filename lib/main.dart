import 'package:feature_toggle_admin/presentation/constants/admin_colors.dart';
import 'package:feature_toggle_admin/presentation/main_page.dart';
import 'package:feature_toggle_admin/presentation/model/rule_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => RuleModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feature Toggle Rule Generator',
      theme: ThemeData(primaryColor: AdminColors.mainBrand),
      home: MainPage(title: 'Feature Toggle Rule Generator'),
    );
  }
}
