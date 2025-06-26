import 'package:fluttertask/modules/edit_profile/views/edit_profile_screen.dart';
import 'package:fluttertask/modules/orders/screen/my_order_screen.dart';
import 'package:fluttertask/modules/profile/screens/profile_screen.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.profileScreen, page: () => const ProfileScreen()),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => const EditProfileScreen(),
    ),
    GetPage(name: Routes.myOrderScreen, page: () => const MyOrderScreen()),
  ];
}
