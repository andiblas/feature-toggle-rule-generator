import 'package:feature_toggle_admin/presentation/constants/admin_sizes.dart';
import 'package:feature_toggle_admin/presentation/model/rule_model.dart';
import 'package:feature_toggle_admin/presentation/show_rule_page.dart';
import 'package:feature_toggle_admin/presentation/widgets/no_rule_card.dart';
import 'package:feature_toggle_admin/presentation/widgets/percentage_id_rule.dart';
import 'package:feature_toggle_admin/presentation/widgets/site_id_in_list_card.dart';
import 'package:feature_toggle_admin/presentation/widgets/user_id_in_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, Widget> _values = {
    "User id in list": UserIdInListCard(),
    "Site id in list": SiteIdInListCard(),
    "Percentage id in list": PercentageIdCard()
  };

  String _selectedOption = "User id in list";
  Widget _buildingRule = NoRuleCard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/icons/ms-logo.png"),
        ),
        title: Text(widget.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: AdminSizes.maxWidth),
            child: Column(
              children: [_buildingRule],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FloatingActionButton(
              child: Icon(Icons.delete),
              tooltip: "Clean",
              heroTag: "btnClean",
              onPressed: () => _cleanRules(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: "Add Rule",
              heroTag: "btnAdd",
              onPressed: () => _showAddRuleDialog(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FloatingActionButton(
                child: Icon(Icons.send),
                tooltip: "Build!",
                heroTag: "btnBuild",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowRulePage()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _showAddRuleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add rule..."),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [_buildDropdown(context, setState)],
            );
          }),
          actions: [
            RaisedButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Text("Add"),
              onPressed: () => _addRuleWidget(_selectedOption),
            ),
          ],
        );
      },
    );
  }

  void _addRuleWidget(String selectedOption) {
    setState(() {
      _buildingRule = _values[selectedOption];
    });
    Navigator.of(context).pop();
  }

  void _cleanRules(BuildContext context) {
    var ruleModel = Provider.of<RuleModel>(context);
    ruleModel.cleanRule();
    setState(() {
      _buildingRule = NoRuleCard();
    });
  }

  Widget _buildDropdown(BuildContext context, StateSetter setState) {
    var items = new List<DropdownMenuItem<String>>();

    _values.forEach((key, value) => {
          items.add(DropdownMenuItem(
            child: Text(key),
            value: key,
          ))
        });

    var dropDownList = DropdownButton(
      items: items,
      onChanged: (value) {
        setState(() {
          _selectedOption = value;
        });
      },
      value: _selectedOption,
    );

    return dropDownList;
  }
}
