import 'package:app/screens/item_rules.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF272362),
      body: Center(
        child: ItemRules()
      ),
    );
  }
}