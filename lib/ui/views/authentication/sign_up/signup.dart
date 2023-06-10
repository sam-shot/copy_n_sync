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

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'username'),
  FormTextField(name: 'cpassword'),
  FormTextField(name: 'name'),
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
                  const S.height(20),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Sign Up",
                      style: h1,
                    ),
                  ),
                  const S.height(20),
                  Text(
                    "Join the Copy-n-Sync community and never lose track of your copied items again. Sign up today and experience the ease and convenience of seamless clipboard syncing across all your devices",
                    style: p,
                  ),
                  const S.height(20),
                  Text(
                    "Email",
                    style: placeholder,
                  ),
                  const S.height(5),
                  AppTextField(
                    controller: emailController,
                    hintText: "e.g email@domain.com",
                    validationMessage: model.emailValidationMessage,
                    focusNode: emailFocusNode,
                    onSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                  ),
                  const S.height(12),
                  Text(
                    "Name",
                    style: placeholder,
                  ),
                  const S.height(5),
                  AppTextField(
                    controller: nameController,
                    hintText: "e.g Samuel Ademujimi",
                    validationMessage: model.nameValidationMessage,
                    focusNode: nameFocusNode,
                    onSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(usernameFocusNode);
                    },
                  ),
                  const S.height(12),
                  Text(
                    "Username",
                    style: placeholder,
                  ),
                  const S.height(5),
                  AppTextField(
                    controller: usernameController,
                    hintText: "",
                    validationMessage: model.usernameValidationMessage,
                    focusNode: usernameFocusNode,
                    onSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                  ),
                  const S.height(12),
                  Text(
                    "Password",
                    style: placeholder,
                  ),
                  const S.height(5),
                  AppTextField(
                    controller: passwordController,
                    isPassword: true,
                    validationMessage: model.passwordValidationMessage,
                    focusNode: passwordFocusNode,
                    onSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(cpasswordFocusNode);
                    },
                  ),
                  const S.height(12),
                  Text(
                    "Confirm Password",
                    style: placeholder,
                  ),
                  const S.height(5),
                  AppTextField(
                    controller: cpasswordController,
                    isPassword: true,
                    validationMessage: model.cpasswordValidationMessage,
                    focusNode: cpasswordFocusNode,
                  ),
                  const S.height(20),
                  CustomButton(
                    ontap: () {
                      model.register();
                    },
                    text: "Sign Up",
                  ),
                  Text(model.status, style: p.copyWith(color: kSecondaryColor)),
                  const S.height(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: 100,
                        color: kSecondaryColor,
                      ),
                      const S.width(10),
                      Text(
                        "OR",
                        style: placeholder,
                      ),
                      const S.width(10),
                      Container(
                        height: 1.5,
                        width: 100,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  const S.height(30),
                  CustomButton(
                    ontap: () {},
                    text: "Sign up with Google",
                    isPrimary: false,
                    hasImage: true,
                    isOutlined: true,
                  ),
                  const S.height(20),
                  Text(
                    "Already have an account?  ",
                    style: placeholder,
                  ),
                  const S.height(10),
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
