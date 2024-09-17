import 'package:get/get.dart';
import 'package:mobies/res/routes/toutes_name.dart';
import 'package:mobies/view/home_view.dart';

class Routes {
  static appRoutes() => [
        GetPage(name: RoutesName.home, page: () => const HomeView()),
      ];
}
