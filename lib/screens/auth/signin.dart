import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trenda/providers/_index.dart';
import 'package:trenda/screens/auth/validators.dart';
import 'package:trenda/utils/_index.dart';
import 'package:trenda/widgets/_index.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
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

  Future login({email, password}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final resp = await ref.read(authProvider).login(
            email: email.trim(),
            password: password.trim(),
          );

      print(resp.status == Status.successful);

      if (resp.status == Status.successful) gotoHome();
    } catch (err) {
      print(err);
      setState(() {
        isLoading = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  gotoHome() => Navigator.pushNamed(context, AppRoutes.homeRoute);

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
                          "Sign in",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.popAndPushNamed(
                                  context, AppRoutes.signUp),
                              child: Text(
                                "Sign up",
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
                      semanticLabel: "Remember me",
                    ),
                    minLeadingWidth: 0.0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Remember me"),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      filledColor: appTheme.primary,
                      title: "Sign in",
                      isLoading: isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login(
                            email: _emailCtrl.text,
                            password: _passwordCtrl.text,
                          );
                          Navigator.pushNamed(context, AppRoutes.homeRoute);
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
