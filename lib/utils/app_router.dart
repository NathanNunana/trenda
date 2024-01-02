part of utils;

class AppRoutes {
  static const String homeRoute = "/";
  static const String signIn = "/signin";
  static const String signUp = "/signup";
  static const String chat = "/chat";
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return _route(const LandingScreen());
      case AppRoutes.signUp:
        return _route(const SignUp());
      case AppRoutes.signIn:
        return _route(const SignIn());
      default:
        return _route(const Loader());
    }
  }

  static Route _route(Widget screen) {
    return CupertinoPageRoute(builder: (_) => screen);
  }
}
