import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/enter_email.form.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/forgot_password_view_model.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class EnterEmail extends StatelessWidget with $EnterEmail {
  EnterEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
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
                  "Did your password pull a disappearing act? Fear not! Our password recovery magic is here to make it reappear faster than a magician pulling a rabbit out of a hat. Abracadabra, and voila!",
                  style: h4,
                ),
                const S.height(20),
                Text(
                  "Enter your Email",
                  style: placeholder,
                ),
                const S.height(5),
                AppTextField(
                  controller: emailController,
                  hintText: "e.g email@domain.com",
                  validationMessage: model.emailValidationMessage,
                ),
                const S.height(20),
                CustomButton(
                  ontap: () {
                    model.next();
                  },
                  text: "Next",
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
