import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bus_ticketing_app/utils/colors.dart';
import 'package:bus_ticketing_app/utils/con_global_variable.dart';

class ConMobileScreenLayout extends StatefulWidget {
  final String user_Qr;
  final UserType newUser;

  // final String user_Id;
  ConMobileScreenLayout({required this.user_Qr, required this.newUser});

  @override
  State<ConMobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<ConMobileScreenLayout> {
  int _page = 0;

  late String QRCode;
  late UserType userObject;

  late PageController pageController;
  @override
  void initState() {
    QRCode = widget.user_Qr;
    userObject = widget.newUser;
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems(QRCode, userObject),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        child: CupertinoTabBar(
          border: null,
          height: 55,
          activeColor: navActivaeColor,
          items: [
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _page == 0
                      ? navActivaeColor
                      : primaryColor, // Define your condition here
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  'assets/details.svg',
                ),
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _page == 1 ? navActivaeColor : primaryColor,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  'assets/wallet.svg',
                ),
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _page == 2 ? navActivaeColor : primaryColor,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  'assets/qrscanner.svg',
                ),
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _page == 3 ? navActivaeColor : primaryColor,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  'assets/bell.svg',
                ),
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _page == 4 ? navActivaeColor : primaryColor,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  'assets/profile.svg',
                ),
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
          ],
          backgroundColor: mobileAppBackgroundColor,
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}
