import 'package:fluttertask/modules/edit_profile/views/edit_profile_screen.dart';
import 'package:fluttertask/modules/orders/screen/my_order_screen.dart';
import 'package:fluttertask/modules/profile/screens/profile_screen.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:fluttertask/modules/profile/bindings/profile_binding.dart';
import 'package:fluttertask/modules/edit_profile/bindings/edit_profile_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(name: Routes.myOrderScreen, page: () => const MyOrderScreen()),
  ];
}
