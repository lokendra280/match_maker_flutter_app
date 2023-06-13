import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../auth/data/model/user_model.dart';
import '../../chat_screen.dart/chat_screen.dart';
import '../../home_screen/home_screen.dart';
import '../../profile/profile.dart';
import '../../setting/setting_screen.dart';
import '../controller/dashboard_controller.dart';

final _unselectedColor = Colors.white54;
final _selectedColor = Colors.white;

class NavigationConstants {
  static const int nestedHomeNavigationId = 1;
  static const int nestedProjectNavigationId = 2;
  static const int subTabLaptopNavigatorId = 3;
}

class LandingPage extends StatefulWidget {
  //final UserModel user;

  const LandingPage({super.key,});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ListQueue<int> _navigationQueue = ListQueue();

  int index = 0;
  final DashboardController dashboardController =
      Get.put(DashboardController());

  final List<Widget> dashboardWidgets =  [
    HomeScreen(),
     const ChatScreen(),
    const SettingPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              title: Text(
                'Exit App',
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              content: Text(
                'Do you want to exit an App?',
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 12,
                ),
              ),
              actions: [
                PrimaryButton(
                  width: 100,
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  title: "No",
                ),
                PrimaryButton(
                  width: 100,
                  onPressed: () => Navigator.of(context).pop(true),
                  //return false when click on "NO"
                  title: "Yes",
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: () async {
        if (dashboardController.index.value == 0) {
          return showExitPopup();
        } else {
          dashboardController.index.value = 0;
          return false;
        }
      },
      child: Scaffold(
        body: Obx(() => IndexedStack(
              index: dashboardController.index.value,
              children: [
              HomeScreen(),
              ChatScreen(),
              const SettingPage(),
ProfilePage(),

              ],
            )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromRGBO(73, 125, 182, 1),
              currentIndex: dashboardController.index.value,
              onTap: dashboardController.onBtnNavTap,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: AppColors.grey1),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Colors.green),
              // color: AppColors.secondaryTextColor),
              selectedIconTheme: const IconThemeData(),
              unselectedIconTheme: IconThemeData(color: _unselectedColor),
              selectedItemColor: _selectedColor,
              unselectedItemColor: _unselectedColor,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/svg/home_trend.svg",
                    color: dashboardController.index.value == 0
                        ? _selectedColor
                        : _unselectedColor,
                  ),
                  label: "Home".tr,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/svg/message_notification.svg",
                    color: dashboardController.index.value == 1
                        ? _selectedColor
                        : _unselectedColor,
                  ),
                  label: "Inbox".tr,
                ),
                // BottomNavigationBarItem(
                //   icon: SvgPicture.asset(
                //     "assets/icons/svg/home_trend.svg",
                //     color: dashboardController.index.value == 2
                //         ? _selectedColor
                //         : _unselectedColor,
                //   ),
                //   label: "Event".tr,
                // ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/svg/Activity.svg",
                    color: dashboardController.index.value == 4
                        ? _selectedColor
                        : _unselectedColor,
                  ),
                  label: "Account".tr,
             
                ),
                   BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                   "assets/icons/svg/project.svg",
                    color: dashboardController.index.value == 3
                         ? _selectedColor
                         : _unselectedColor,
                 ),
                  label: "Search".tr,
               ),
               ],
            )),
      ),
    );
  }
}
