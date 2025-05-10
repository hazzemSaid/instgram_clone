import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/textfieldwidget.dart';

class SginupScreen extends StatelessWidget {
  SginupScreen({super.key});
  final fromkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: fromkey,
          child: Column(
            children: [
              Flexible(flex: 2, child: Container()),
              Flexible(
                child: SvgPicture.asset(
                  'assets/images/ic_instagram.svg',
                  color: primaryColor,
                  fit: BoxFit.fitHeight,
                  height: height / 18,
                ),
              ),
              SizedBox(height: height / 19, width: double.infinity),
              Flexible(child: CircleAvatar(radius: 64)),
              SizedBox(height: height / 19, width: double.infinity),
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormFieldwidget(
                    controller: _usernameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    hintText: 'Username',
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 17, width: double.infinity),
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormFieldwidget(
                    controller: _emailController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(height: 17, width: double.infinity),
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormFieldwidget(
                    controller: _passwordController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              SizedBox(height: 17, width: double.infinity),
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Sign up'),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      LoginScreen(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                var begin = Offset(-1.0, 0.0);
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
                        child: const Text('Log in'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
