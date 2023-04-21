import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
 const StartupView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<StartupViewModel>.reactive(
    onViewModelReady: (viewModel) {
      viewModel.init();
    },
     builder: (context, model, child) => Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(child: Center(
        child: Text("Copy-n-Sync", style: h1,),
      )),
     ),
     viewModelBuilder: () => StartupViewModel(),
   );
 }
}