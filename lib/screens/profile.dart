import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trenda/utils/_index.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget spacer(double size) {
    return SizedBox(
      height: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Container(
      color: appTheme.bgColor,
      child: SafeArea(
        child: Column(
          children: [
            spacer(10),
            const Text(
              "Trenda Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            spacer(10),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: appTheme.light,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                minLeadingWidth: 0.0,
                contentPadding: const EdgeInsets.only(right: 10),
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: appTheme.primary,
                ),
                title: const Text(
                  "Guest",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: const Text(
                  "guest account",
                  style: TextStyle(color: Colors.black54),
                ),
                trailing: const Icon(CupertinoIcons.forward),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: appTheme.light,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.headphones,
                      color: appTheme.primary,
                    ),
                    title: const Text(
                      "Customer Support",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    subtitle: const Text(
                      "Report any issue to our team",
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                    ),
                    trailing: const Icon(CupertinoIcons.forward),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: appTheme.light,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.color_filter,
                      color: appTheme.primary,
                    ),
                    title: const Text(
                      "Personalization",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    subtitle: const Text(
                      "Change app to fit your preference",
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                    ),
                    trailing: const Icon(CupertinoIcons.forward),
                  ),
                  const ListTile(
                    leading: Icon(
                      CupertinoIcons.info,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "About",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    subtitle: Text(
                      "Learn about trenda mobile",
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                    ),
                    trailing: Icon(CupertinoIcons.forward),
                  )
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: 100,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: BorderSide(
                      color: appTheme.danger,
                    )),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.signIn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "Logout",
                    //   style: TextStyle(
                    //     color: appTheme.danger,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    Icon(
                      Icons.logout_sharp,
                      color: appTheme.danger,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            spacer(15)
          ],
        ),
      ),
    );
  }
}
