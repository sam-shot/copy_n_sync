import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login_view_model.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                S.height(25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
                    style: h1,
                  ),
                ),
                S.height(30),
                Text(
                  "To make your experience seemless, directly login with your google account by clicking the google icon below",
                  style: p,
                ),
                S.height(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: kSecondaryColor.withOpacity(0.3),
                      radius: 80,
                      child: Image.asset(
                        AppAsset.googleIcon,
                      ),
                    ),
                  ],
                ),
                S.height(50),
                Divider(
                  thickness: 2,
                  color: kSecondaryColor,
                ),
                S.height(30),
                CustomButton(ontap: () {
                  
                },
                text: "Login with Email",
                ),
                S.height(30),
                Text("Don’t have an account? We got you! ", style: placeholder,),
                S.height(10),
                CustomButton(ontap: () {
                  
                },
                text: "Sign Up",
                isPrimary: false,
                ),

              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
