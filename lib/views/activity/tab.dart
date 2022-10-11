import 'package:flutter/material.dart';

import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/views/activity.dart';

import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class TabActivity extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  List<Widget> containers = [
    const ActivityPage(
      status: '11111111',
    ),
    const ActivityPage(
      status: '87654321',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop('update'),
          ),
          backgroundColor: ColorsApp.baseColor,
          title: TextLabel(
            text: "Activity",
            color: ColorsApp.white,
            font: FontApp.interBold,
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: ColorsApp.white,
            tabs: <Widget>[
              Tab(
                text: 'NIK:11111111',
              ),
              Tab(
                text: 'NIK:876564321',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }
}
