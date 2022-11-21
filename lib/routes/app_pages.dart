import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hook_up_rent/pages/forgot_password.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/room_add/index.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';
import 'package:hook_up_rent/pages/room_manage/index.dart';
import 'package:hook_up_rent/pages/setting.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

part 'app_routes.dart';

// ignore_for_file: constant_identifier_names
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routePages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => SignInScreen(
        actions: [
          ForgotPasswordAction(((context, email) {
            Navigator.of(context)
                .pushNamed('/forgot-password', arguments: {'email': email});
          })),
          AuthStateChangeAction(((context, state) {
            if (state is SignedIn || state is UserCreated) {
              var user = (state is SignedIn)
                  ? state.user
                  : (state as UserCreated).credential.user;
              if (user == null) {
                return;
              }
              if (state is UserCreated) {
                user.updateDisplayName(user.email!.split('@')[0]);
              }
              if (!user.emailVerified) {
                user.sendEmailVerification();
                const snackBar = SnackBar(
                    content: Text(
                        'Please check your email to verify your email address'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              Navigator.of(context).pushReplacementNamed('/home');
            }
          })),
        ],
      ),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const PageContent(name: 'Search'),
    ),
    GetPage(
      name: Routes.ROOM_MANAGE,
      page: () => const RoomManagePage(),
      children: [
        GetPage(
          name: Routes.ROOM_ADD,
          page: () => const RoomAddPage(),
        ),
        GetPage(
          name: Routes.ROOM_DETAIL,
          page: () => const RoomDetailPage(),
        ),
      ],
    ),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfileScreen(
              providers: [],
              actions: [
                SignedOutAction(
                  ((context) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }),
                ),
              ],
            )),
    GetPage(
        name: Routes.FORGOT_PASSWORD,
        page: () => const ForgotPasswordPage()
    )
  ];
}
