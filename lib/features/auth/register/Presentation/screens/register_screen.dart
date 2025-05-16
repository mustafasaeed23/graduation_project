import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/auth/register/Presentation/cubit/register_cubit.dart';
import 'package:graduation_project/features/auth/register/Presentation/cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ToastManager.showBottomSmallToastSuccess(
              context: context,
              description: "Failed to create account",
              bgColor: Colors.red,
            );
          } else if (state is RegisterSuccessState) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text("Registration Successful"),
            //     backgroundColor: Colors.green,
            //   ),
            // );
            ToastManager.showBottomSmallToastSuccess(
              context: context,
              description: "Account Created Successfully",
              bgColor: Colors.green,
            );
            context.pushNamed(Routes.homePage);
          }
        },
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo2.png",
                        // width: 50.w,
                        height: 300.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Create Reels with AI.",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // SizedBox(height: 10.h),
                    Text(
                      "Instantly.",
                      style: GoogleFonts.poppins(
                        color: AppColors.goldColor,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Sign up to unlock powerful tools for automated content \ncreation",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        // fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 50.w),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Create your Account",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        "Full Name",
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
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? "Please enter your full name"
                                      : null,
                          controller: fullNameController,
                          style: TextStyle(color: Colors.white),

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
                            // hintText: "Enter your full name",
                            labelText: "Enter your full name",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
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

                          controller: emailController,
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
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                          controller: passwordController,
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
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        text: "Create Account",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                              email: emailController.text,
                              password: passwordController.text,
                              name: fullNameController.text,
                            );
                          }
                        },
                        color: AppColors.wamdahGoldColor2,
                        width: 300,
                        height: 45.h,
                        fontSize: 14,
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushNamed(Routes.loginScreen);
                            },
                            child: Text(
                              " Sign In",
                              style: GoogleFonts.poppins(
                                color: AppColors.wamdahGoldColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
