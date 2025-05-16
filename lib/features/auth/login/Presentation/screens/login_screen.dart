import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Import connectivity_plus
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/features/auth/login/cubit/login_cubit.dart';
import 'package:graduation_project/features/auth/login/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to check internet connection
  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ToastManager.showBottomSmallToastSuccess(
              context: context,
              description: "Logged In Successfully",
              bgColor: Colors.green,
            );
            Future.delayed(const Duration(milliseconds: 500), () {
              context.pushReplacementNamed(Routes.homePage);
            });
          } else if (state is LoginError) {
            ToastManager.showBottomSmallToastSuccess(
              context: context,
              description: "Failed to Login!",
              bgColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo2.png",
                      // width: 50.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      "Sign in to your account",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    EmailInformationWidget(controller: emailController),
                    SizedBox(height: 10.h),
                    PasswordInformationWidget(controller: passwordController),
                    const SizedBox(height: 40),
                    if (state is LoginLoading)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        color: AppColors.wamdahGoldColor2,
                        width: 300,
                        height: 40,
                        text: "Login",

                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        onPressed: () async {
                          // Check connection before proceeding with login
                          bool isConnected = await checkConnection();
                          if (!isConnected) {
                            ToastManager.showErrorToast(
                              "Connection",
                              context,
                              "No Internet",
                            );
                            return;
                          }
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                      ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 100, height: 1, color: Colors.white),
                        Text12(text: "  OR  "),
                        Container(width: 100, height: 1, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/googlesvg.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Text(
                                "  Google",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Container(
                          width: 50.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/ios.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Text(
                                "  Apple",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.registerScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text14(
                            text: "Don't Have an Account? ",
                            weight: FontWeight.bold,
                            textColor: Colors.white,
                          ),
                          Text14(
                            text: "Sign Up",
                            weight: FontWeight.bold,
                            textColor: AppColors.wamdahGoldColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmailInformationWidget extends StatelessWidget {
  const EmailInformationWidget({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 300,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
              ).hasMatch(value)) {
                return "Please enter a valid email address";
              }
              return null;
            },

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),

            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.wamdahSecoundPrimary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Enter your Email",
              labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInformationWidget extends StatelessWidget {
  const PasswordInformationWidget({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 300,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              } else if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            obscureText: true,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.wamdahSecoundPrimary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Enter your Password",
              labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
