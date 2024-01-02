import 'package:flutter/cupertino.dart';
import 'package:trenda/utils/_index.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Container(
      color: appTheme.bgColor,
    );
  }
}
