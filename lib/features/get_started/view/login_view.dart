import 'package:final_projects/core/localization/app_string_keys.dart';
import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/app_strings.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/core/utils/password_textfield.dart';
import 'package:final_projects/core/utils/text_field_widget.dart';
import 'package:final_projects/features/get_started/manager/register_cubit.dart';
import 'package:final_projects/features/get_started/manager/register_state.dart';
import 'package:final_projects/features/get_started/view/get_started_view.dart';
import 'package:final_projects/features/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GetStarted();
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                AppAssets.arrow_back,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 69, left: 32, right: 158),
                    child: Container(
                      width: 185,

                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 26,
                      left: 32,
                      bottom: 22,
                      top: 45,
                    ),
                    child: TextfiledWidget(
                      hint: "Enter Your Email",
                      label: "Email",
                      icon: AppAssets.email_icon,
                      control: OnboardingCubit.get(context).namecontroller,
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 26,
                      left: 32,
                      bottom: 56,
                    ),
                    child: PasswordTextField(
                      label: "Password",
                      control: OnboardingCubit.get(context).passwordcontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 29, left: 29),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: BlocConsumer<OnboardingCubit, OnboardingState>(
                        listener: (context, state) {
                          print(state.toString());
                        },
                        builder: (context, state) {
                          if (state is OnboardingLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is OnboardingSucessState) {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Success")),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            });
                          } else if (state is OnboardingErrorState) {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            });
                          }
                          return ElevatedButton(
                            onPressed: () {
                              final email =
                                  OnboardingCubit.get(
                                    context,
                                  ).namecontroller.text.trim();
                              final password =
                                  OnboardingCubit.get(
                                    context,
                                  ).passwordcontroller.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Please enter both email and password",
                                    ),
                                  ),
                                );
                              } else {

                                OnboardingCubit.get(context).Login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              AppStrings.login,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                                color: AppColor.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
