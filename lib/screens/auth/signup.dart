import 'package:trenda/screens/auth/validators.dart';
import 'package:trenda/utils/_index.dart';
import 'package:trenda/widgets/_index.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _phoneCtrl;

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _usernameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _usernameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Widget spacer(double size) {
    return SizedBox(
      height: size,
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacer(20),
                  SizedBox(
                    height: 180,
                    child: Image.asset(
                      "assets/logo/trenda_logo1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.signIn),
                              child: Text(
                                "Sign in",
                                style: TextStyle(color: appTheme.primary),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  spacer(40),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailCtrl,
                    validate: Validators.emailValidator,
                    hintText: "username@domain.com",
                  ),
                  spacer(20),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    controller: _usernameCtrl,
                    validate: Validators.defaultValidator,
                    hintText: "trenda",
                  ),
                  spacer(20),
                  CustomTextField(
                    inputType: InputType.phoneNumber,
                    keyboardType: TextInputType.number,
                    controller: _phoneCtrl,
                    validate: Validators.phoneValidator,
                    hintText: "545 xxx xxx",
                  ),
                  spacer(20),
                  CustomTextField(
                    inputType: InputType.password,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordCtrl,
                    validate: Validators.passwordValidator,
                    hintText: "**************",
                  ),
                  ListTile(
                    leading: Checkbox(
                      activeColor: appTheme.primary,
                      value: true,
                      onChanged: (value) => {},
                      semanticLabel: "Terms and Condition",
                    ),
                    minLeadingWidth: 0.0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text("I agree with Terms and Privacy"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      isLoading: isLoading,
                      filledColor: appTheme.primary,
                      title: "Create your free account",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
