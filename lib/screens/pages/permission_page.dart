import 'package:flutter/material.dart';

import '../../widgets/appabr_widget.dart';

class PermissionPage extends StatelessWidget {
  PageController page = PageController();

  PermissionPage({required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(page),
    );
  }
}
