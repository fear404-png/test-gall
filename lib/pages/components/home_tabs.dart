import 'package:flutter/material.dart';
import 'package:test_gall/pages/components/home_tab.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        HomeTab(
          title: "New",
          isTap: true,
        ),
        HomeTab(
          title: "Popular",
          isTap: false,
        ),
      ],
    );
  }
}
