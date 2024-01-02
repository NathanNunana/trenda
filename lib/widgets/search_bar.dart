part of widgets;

class CustomSearch extends StatelessWidget {
  final String hintText;
  const CustomSearch({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        filled: true,
        fillColor: appTheme.light,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        suffixIcon: Icon(
          Icons.search,
          size: 20,
          color: appTheme.border,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: appTheme.border,
          ),
        ),
      ),
    );
  }
}
