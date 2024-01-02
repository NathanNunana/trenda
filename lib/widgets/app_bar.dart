part of widgets;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  Widget spaceX(double size) {
    return SizedBox(
      width: size,
    );
  }

  Widget spaceY(double size) {
    return SizedBox(
      height: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/icon.png"),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(
                  "assets/images/profile.jpeg",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          spaceY(39),
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 10.0,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(CupertinoIcons.search),
                      hintText: "Jump to or search..."),
                ),
              ),
              spaceX(13),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: appTheme.light,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(Icons.filter_list),
              )
            ],
          )
        ],
      ),
    );
  }
}
