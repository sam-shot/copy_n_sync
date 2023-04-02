import 'package:copy_n_sync/ui/views/authentication/sign_up/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';


@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'name'),
  FormTextField(name: 'password'),
  FormTextField(name: 'cpassword'),
])
class SignUpView extends StatelessWidget {
 const SignUpView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SignUpViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => SignUpViewModel(),
   );
 }
}