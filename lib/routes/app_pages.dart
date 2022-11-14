import 'package:get/get_navigation/src/routes/get_route.dart';
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
      page: () => const LoginPage(),
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
      page: () => const PageContent(name: '搜索'),
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
  ];
}
