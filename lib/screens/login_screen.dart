import 'package:email_validator/email_validator.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:instagram_clone/screens/sginup_screen.dart";
import "package:instagram_clone/utils/colors.dart";
import "package:instagram_clone/widgets/textfieldwidget.dart"
    show TextFormFieldwidget;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final fromkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: fromkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height / 14,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/images/ic_instagram.svg',
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 18),

                Flexible(
                  child: TextFormFieldwidget(
                    controller: _emailController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 17),
                Flexible(
                  child: TextFormFieldwidget(
                    controller: _passwordController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(height: 21),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (fromkey.currentState!.validate()) {
                          // Perform login action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0095F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Log in'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      SginupScreen(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset(0.0, 0.0);
                                var curve = Curves.easeInOut;

                                var tween = Tween<Offset>(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                              transitionDuration: const Duration(
                                milliseconds: 900,
                              ),
                            ),
                          );
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
