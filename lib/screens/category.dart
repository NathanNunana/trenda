import 'package:flutter/material.dart';
import 'package:trenda/utils/_index.dart';
import 'package:trenda/widgets/_index.dart';

class Category extends StatelessWidget {
  Category({super.key});
  final List<String> products = [
    "Foundation",
    "Powder",
    "Lip Gloss",
    "Eye Shadow",
    "Mascara",
    "Powder",
  ];

  final List<String> products2 = [
    "Jackets",
    "Shirts",
    "Skirt",
    "Hats",
    "Drip",
    "Bolla",
  ];

  final List<String> products3 = [
    "Shoes",
    "Boots",
    "Kicks",
    "Easy Wears",
    "Chalewate",
    "Red boot",
  ];
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return SafeArea(
      child: Container(
        color: appTheme.bgColor,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomSearch(
                  hintText:
                      "Search Clothings, Shoes, Brands, Accessories, ..."),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CategoryItems(
                    title: "Makeup",
                    products: products,
                  ),
                  CategoryItems(
                    title: "Clothings",
                    products: products2,
                  ),
                  CategoryItems(
                    title: "Foot Wears",
                    products: products3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryItems extends StatelessWidget {
  final List<String> products;
  final String title;
  const CategoryItems({super.key, required this.products, required this.title});

  Widget spacer(double size) {
    return SizedBox(
      height: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appTheme.light,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.homeRoute),
                  child: Text(
                    "SEE ALL",
                    style: TextStyle(
                        color: appTheme.primary, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: appTheme.border.withOpacity(.2),
            height: 0,
          ),
          spacer(15),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: products
                    .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size.width / 4 - 25,
                              width: (size.width / 3) - 25,
                              decoration: BoxDecoration(
                                color: appTheme.border.withOpacity(.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            spacer(5),
                            Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            spacer(20)
                          ],
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
