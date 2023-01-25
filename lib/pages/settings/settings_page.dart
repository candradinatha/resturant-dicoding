import 'package:flutter/material.dart';
import 'package:restaurant/widgets/common/app_bar_center.dart';

import '../../styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCenter(
        title: "Settings",
      ),
      backgroundColor: colorBgDark,
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
