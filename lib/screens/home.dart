import 'package:flutter/material.dart';
import 'package:trenda/models/service.dart';
import 'package:trenda/utils/_index.dart';
import 'package:trenda/widgets/_index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget spacer(double size) {
    return SizedBox(
      height: size,
    );
  }

  final List<Category> _services = [
    Category(name: "General", imageUrl: ""),
    Category(name: "Sports & Outdoors", imageUrl: ""),
    Category(name: "Babies & Kids", imageUrl: ""),
    Category(name: "Electronics", imageUrl: ""),
    Category(name: "Fasion", imageUrl: ""),
    Category(name: "Furnitures & Appliance", imageUrl: ""),
    Category(name: "Health & Beauty", imageUrl: ""),
    Category(name: "Vehicles", imageUrl: ""),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Container(
      color: appTheme.bgColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/logo/trenda_logo1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, AppRoutes.chat),
                            icon: const Icon(Icons.shopping_bag_sharp),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 5,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: appTheme.danger,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  color: appTheme.light,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CustomSearch(
                      hintText:
                          "Search Clothings, Shoes, Brands, Accessories, ..."),
                ),
                spacer(10)
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration:
                        BoxDecoration(color: appTheme.border.withOpacity(.5)),
                  ),
                  spacer(20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: _services
                        .map((e) => Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      appTheme.border.withOpacity(.5),
                                  backgroundImage: AssetImage(e.imageUrl),
                                ),
                                spacer(10),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                  spacer(20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Ads",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            "SEE ALL",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              mainAxisExtent: 280),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: appTheme.border.withOpacity(.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
