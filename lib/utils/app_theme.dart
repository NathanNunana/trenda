part of utils;

class AppTheme {
  Color primary;
  Color secondary;
  Color border;
  Color bgColor;
  Color dark = const Color(0xff000000);
  Color light = const Color(0xffFFFFFF);
  Color danger = const Color(0xffFF0000);

  AppTheme({
    required this.primary,
    required this.secondary,
    required this.border,
    required this.bgColor,
  });

  static AppTheme _dark() {
    return AppTheme(
      primary: const Color(0xff008080),
      secondary: const Color(0xffE7E7FD),
      border: const Color(0xff010138),
      bgColor: const Color(0xff483285),
    );
  }

  static AppTheme _light() {
    return AppTheme(
      primary: const Color(0xff008080),
      secondary: const Color(0xffE7E7FD),
      border: const Color(0xffB8B2BC),
      bgColor: const Color(0xffF3F3FB),
    );
  }

  static AppTheme appTheme(context) {
    final theme = CupertinoTheme.of(context).brightness;
    return (Brightness.dark == theme) ? _dark() : _light();
  }
}
