import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/BrowserSessions/BrowserSessions.dart';
import 'package:cryptodesign/Screens/DeleteAccount/DeleteAccount.dart';
import 'package:cryptodesign/Screens/EmailChange/EmailChange.dart';
import 'package:cryptodesign/Screens/LoginPage/LoginPage.dart';
import 'package:cryptodesign/Screens/PasswordChange/PasswordChange.dart';
import 'package:cryptodesign/Screens/TFAScreen/TFAScreen.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/DarkThemeSwitch.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool profileMenu = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SafeArea(
        child: SizedBox(
          height: 450,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(550),
                bottomRight: Radius.circular(550)),
            child: Drawer(
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  color: CommonColors().appTheme,
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //   Color.fromRGBO(0, 188, 212, 1),
                  //   Color.fromRGBO(0, 161, 255, 1),
                  //   Color.fromRGBO(0, 161, 255, 1),
                  //   Color.fromRGBO(0, 188, 212, 1),
                  // ])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    ChangeThemeButtonWidget(),
                    SizedBox(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          'User:'
                          '\nyuvaraja.clarisco@gmail.com',
                          textAlign: TextAlign.left,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      color: CommonColors().white(context),
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            profileMenu = !profileMenu;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CustomText(
                                'Profile',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              Icon(
                                profileMenu
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: profileMenu,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    NavigatorsCommon().backPage(context);
                                    NavigatorsCommon()
                                        .newPageRoute(context, EmailChange());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        'Email Change',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    NavigatorsCommon().backPage(context);
                                    NavigatorsCommon().newPageRoute(
                                        context, PasswordChange());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.key,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        'Password Change',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    NavigatorsCommon().backPage(context);
                                    NavigatorsCommon()
                                        .newPageRoute(context, TFAScreen());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.security,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        'TFA Activation',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    NavigatorsCommon().backPage(context);
                                    NavigatorsCommon().newPageRoute(
                                        context, BrowserSessions());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.open_in_browser,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        'Browser Sessions',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    NavigatorsCommon()
                                        .newPageRoute(context, DeleteAccount());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete_forever,
                                        color: CommonColors().red,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        'Delete Account',
                                        color: CommonColors().red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          NavigatorsCommon()
                              .newPageReplaceRoute(context, LoginPage());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CustomText(
                              'Logout',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
