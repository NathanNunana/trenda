part of widgets;

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final InputType? inputType;
  final String? Function(String? value)? validate;
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.inputType,
      this.validate});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscurePassword;
  String selectedCountryCode = '+1'; // Default country code

  @override
  void initState() {
    super.initState();
    obscurePassword = true;
  }

  InputDecoration inputDecoration(appTheme) {
    switch (widget.inputType) {
      case InputType.password:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          filled: true,
          fillColor: appTheme.light,
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: obscurePassword
                ? const Icon(
                    CupertinoIcons.eye_slash,
                    size: 20,
                  )
                : const Icon(
                    CupertinoIcons.eye,
                    size: 20,
                  ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.border,
            ),
          ),
        );
      case InputType.phoneNumber:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          filled: true,
          fillColor: appTheme.light,
          hintText: widget.hintText,
          prefixIcon: DropdownButton<String>(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            value: selectedCountryCode,
            onChanged: (String? newValue) {
              setState(() {
                selectedCountryCode = newValue!;
              });
            },
            items: ['+233', '+234', '+1', '+81']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.border,
            ),
          ),
        );
      default:
        return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          filled: true,
          fillColor: appTheme.light,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.border,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return TextFormField(
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText:
          widget.inputType == InputType.password ? obscurePassword : false,
      decoration: inputDecoration(appTheme),
    );
  }
}
