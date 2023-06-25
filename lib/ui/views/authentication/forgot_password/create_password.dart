import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/create_password.form.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/forgot_password_view_model.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'password'),
  FormTextField(name: 'cpassword'),
])
class CreatePassword extends StatelessWidget with $CreatePassword {
  CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
        viewModel.startCountdown();
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    splashRadius: 30,
                    onPressed: () {
                      model.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                const S.height(20),
                Text(
                  "Forgot Password",
                  style: h1,
                ),
                const S.height(15),
                Text(
                    "Keep your account secure with a new password. Update it now!",
                    style: h4),
                const S.height(20),
                Text(
                  "New Password",
                  style: placeholder,
                ),
                const S.height(5),
                AppTextField(
                  controller: passwordController,
                  hintText: "",
                  validationMessage: model.passwordValidationMessage,
                  focusNode: passwordFocusNode,
                  isPassword: true,
                  onSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(cpasswordFocusNode);
                  },
                ),
                const S.height(20),
                Text(
                  "New Password",
                  style: placeholder,
                ),
                const S.height(10),
                AppTextField(
                    controller: cpasswordController,
                    hintText: "",
                    isPassword: true,
                    validationMessage: model.cpasswordValidationMessage,
                    focusNode: cpasswordFocusNode),
                const S.height(20),
                CustomButton(
                  ontap: () {
                    model.updatePassword();
                  },
                  text: "Reset Password",
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ForgotPasswordViewModel(),
    );
  }
}
