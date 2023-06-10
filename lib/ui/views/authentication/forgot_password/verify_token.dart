import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/forgot_password_view_model.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/verify_token.form.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'verifycode'),
])
class VerifyToken extends StatelessWidget with $VerifyToken {
  VerifyToken({Key? key}) : super(key: key);

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
                  "Verification Code",
                  style: h1,
                ),
                const S.height(15),
                 Text(
                  "Great things are coming your way! We've sent you a code to your email address. Take a moment to check your inbox, copy the code, and paste it into the app. Prepare to enjoy effortless copying and syncing for a seamless workflow! - It expires in 5 Miutes",
                  style: h4,
                ),
                const S.height(20),
                Text(
                  "Verification Code",
                  style: placeholder,
                ),
                const S.height(5),
                AppTextField(
                  controller: verifycodeController,
                  hintText: "",
                  validationMessage: model.verifycodeValidationMessage,
                ),
                Row(
                  children: [
                    Text(
                      "Didn't get code?",
                      style: placeholder.copyWith(fontSize: 14),
                    ),
                    const S.width(10),
                    !model.canResend
                        ? Text(
                            "Resend",
                            style: placeholder.copyWith(
                                fontSize: 14, color: kGrey),
                          )
                        : InkWell(
                            onTap: () {
                              model.resend();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Resend",
                                style: placeholder.copyWith(
                                    fontSize: 16, color: kSecondaryColor),
                              ),
                            ),
                          ),
                    const S.width(10),
                    model.canResend
                        ? Container()
                        : Text(
                            "00:${model.countdownSeconds}",
                            style: placeholder.copyWith(
                                fontSize: 14, color: kError),
                          ),
                  ],
                ),
                const S.height(30),
                CustomButton(
                  ontap: () {
                    model.verify();
                  },
                  text: "Verify",
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
