import 'package:flutter/material.dart';

import '../../widgets/appabr_widget.dart';

class UsersPage extends StatelessWidget {
  PageController page = PageController();

  UsersPage({required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(page),
    );
  }
}
