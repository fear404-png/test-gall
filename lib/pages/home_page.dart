import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

import 'components/home_tabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [HomeTabs()],
    );
  }
}
