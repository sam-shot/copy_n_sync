import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.form.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup_view_model.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:rive/rive.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'username'),
  FormTextField(name: 'cpassword'),
])
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  S.height(20),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Sign Up",
                      style: h1,
                    ),
                  ),
                  S.height(20),
                  Text(
                    "Join the Copy-n-Sync community and never lose track of your copied items again. Sign up today and experience the ease and convenience of seamless clipboard syncing across all your devices",
                    style: p,
                  ),
                  S.height(20),
                  Text(
                    "Email",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: emailController,
                    hintText: "e.g email@domain.com",
                  ),
                  S.height(12),
                  Text(
                    "Username",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: usernameController,
                    hintText: "",
                  ),
                  S.height(12),
                  Text(
                    "Password",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: passwordController,
                    isPassword: true,
                  ),
                  S.height(12),
                  Text(
                    "Confirm Password",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: cpasswordController,
                    isPassword: true,
                  ),
                  S.height(20),
                  CustomButton(
                    ontap: () {
                      model.register();
                    },
                    text: "Sign Up",
                  ),
                  Text(model.status, style: p.copyWith(color: kSecondaryColor)),
                  
                  S.height(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: 100,
                        color: kSecondaryColor,
                      ),
                      S.width(10),
                      Text(
                        "OR",
                        style: placeholder,
                      ),
                      S.width(10),
                      Container(
                        height: 1.5,
                        width: 100,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  S.height(30),
                  CustomButton(
                    ontap: () {},
                    text: "Sign up with Google",
                    isPrimary: false,
                    hasImage: true,
                    isOutlined: true,
                  ),
                  S.height(20),
                  Text(
                    "Already have an account?  ",
                    style: placeholder,
                  ),
                  S.height(10),
                  CustomButton(
                    ontap: () {
                      model.navigateToLogin();
                    },
                    text: "Login here",
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
