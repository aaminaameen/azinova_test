
import 'package:azinova/presentation/screens/auth/login.dart';
import 'package:azinova/presentation/screens/home/home.dart';
import 'package:azinova/presentation/screens/home/items_detail.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  
  initialLocation: RouterPath.home,
  routes: [
    GoRoute(
      path: RouterPath.login,
      name: RouterPath.login,
      builder: (context, state) => const LoginPage(),
    ),
   
  
    GoRoute(
      path: RouterPath.home,
      name: RouterPath.home,
      builder: (context, state) => const HomePage(),
    ),

   GoRoute(
      path: RouterPath.itemList,
      name: RouterPath.itemList,
      builder: (context, state) => const ItemDetailsPage(item: {},),
    ),

  
  ],
);

class RouterPath  {
  static const login = '/';
  static const home = '/home';
  static const itemList = '/item_list';
  
}
