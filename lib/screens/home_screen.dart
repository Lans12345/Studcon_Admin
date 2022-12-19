import 'package:consultation_system/screens/pages/permission_page.dart';
import 'package:consultation_system/screens/pages/roles_page.dart';
import 'package:consultation_system/screens/pages/users_page.dart';
import 'package:consultation_system/screens/tabs/analytics_tab.dart';
import 'package:consultation_system/screens/tabs/dashboard_tab.dart';
import 'package:consultation_system/screens/tabs/feedback_tab.dart';
import 'package:consultation_system/screens/tabs/messages_tab.dart';
import 'package:consultation_system/screens/tabs/notif_tab.dart';
import 'package:consultation_system/screens/tabs/reports_tab.dart';
import 'package:consultation_system/screens/tabs/settings_tab.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constant/colors.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 632,
            color: primary,
            child: SideMenu(
              controller: page,
              style: SideMenuStyle(
                  unselectedTitleTextStyle:
                      const TextStyle(color: Colors.white),

                  // showTooltip: false,
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: blueAccent,
                  selectedColor: Colors.black38,
                  selectedTitleTextStyle:
                      GoogleFonts.openSans(color: Colors.white),
                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.white
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  // ),
                  // backgroundColor: Colors.blueGrey[700]
                  ),
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(
                        bottom: BorderSide(width: 1, color: greyAccent))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/bsu.png',
                        width: 33,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BoldText(
                        label: 'STUDCON',
                        fontSize: 24,
                        color: blueAccent,
                      ),
                    ],
                  ),
                ),
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Permission',
                  onTap: () {
                    page.jumpToPage(0);
                  },
                  icon: const Icon(Icons.info),
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Users',
                  onTap: () {
                    page.jumpToPage(1);
                  },
                  icon: const Icon(Icons.group),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Reports',
                  onTap: () {
                    page.jumpToPage(2);
                  },
                  icon: const Icon(Icons.report_problem_rounded),
                ),
                SideMenuItem(
                  priority: 3,
                  title: 'Analytics',
                  onTap: () {
                    page.jumpToPage(3);
                  },
                  icon: const Icon(Icons.analytics),
                ),
                SideMenuItem(
                  priority: 4,
                  title: 'Feedback',
                  onTap: () {
                    page.jumpToPage(4);
                  },
                  icon: const Icon(Icons.feedback),
                ),
                SideMenuItem(
                  onTap: () {
                    page.jumpToPage(5);
                  },
                  priority: 5,
                  title: 'Settings',
                  icon: const Icon(Icons.settings),
                ),
                SideMenuItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return Dialog(
                            child: SizedBox(
                              height: 400,
                              width: 400,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: MaterialButton(
                                            child: NormalText(
                                                label: 'Add Category',
                                                fontSize: 12,
                                                color: Colors.white),
                                            color: Colors.green,
                                            onPressed: (() {})),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: ListView.builder(
                                            itemBuilder: ((context, index) {
                                          return ListTile();
                                        })),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
                  },
                  priority: 6,
                  title: 'Categories',
                  icon: const Icon(Icons.category_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                PermissionPage(page: page),
                UsersPage(page: page),
                ReportTab(
                  page: page,
                ),
                AnalyticsTab(
                  page: page,
                ),
                FeedbackTab(
                  page: page,
                ),
                SettingsTab(
                  page: page,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
