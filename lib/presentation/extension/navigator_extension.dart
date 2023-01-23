import 'package:flutter/widgets.dart';
import 'package:stan_handel_web/presentation/page/home/home_page.dart';

extension SafeNavigator on Navigator {
  static Future<Object?> pushNamed(BuildContext context, String route) async {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    final isSameRoute = currentRoute == route;
    if (isSameRoute) return null;

    final push = await Navigator.of(context).pushNamed(route);
    return push;
  }

  static void pop(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    final isHomePageRoute = currentRoute == HomePage.route;
    if (isHomePageRoute) return;
    return Navigator.of(context).pop();
  }
}
