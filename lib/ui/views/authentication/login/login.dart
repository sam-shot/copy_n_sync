import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.form.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login_view_model.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
      },
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
                      "Login",
                      style: h1,
                    ),
                  ),
                  S.height(20),
                  Text(
                    "With Copy-N-Sync, sharing your clipboard has never been easier. Login to enjoy fast and efficient copying and pasting across all your devices",
                    style: p,
                  ),
                  S.height(20),
                  Text(
                    "Email",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: passwordController,
                    hintText: "e.g email@domain.com",
                  ),
                  S.height(12),
                  Text(
                    "Password",
                    style: placeholder,
                  ),
                  S.height(5),
                  AppTextField(
                    controller: emailController,
                    isPassword: true,
                  ),
                  S.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: placeholder.copyWith(
                            color: kPrimaryColor, fontSize: 14),
                      ),
                    ],
                  ),
                  S.height(10),
                  CustomButton(
                    ontap: () {
                      model.login();
                    },
                    text: "Login",
                  ),
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
                    text: "Login with Google",
                    isPrimary: false,
                    hasImage: true,
                    isOutlined: true,
                  ),
                  S.height(20),
                  Text(
                    "Don’t have an account? We got you! ",
                    style: placeholder,
                  ),
                  S.height(10),
                  CustomButton(
                    ontap: () {
                      model.navigateToSignup();
                    },
                    text: "Sign Up here",
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
