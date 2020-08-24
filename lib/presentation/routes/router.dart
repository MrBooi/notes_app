import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes_ddd_app/presentation/sign_in/sign_in_page.dart';
import 'package:notes_ddd_app/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
  ],
)
class $Router {}
