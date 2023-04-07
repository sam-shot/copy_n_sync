import 'package:copy_n_sync/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
 const HomeView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<HomeViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
      body: Center(
        child: Text("user Created"),
      ),
     ),
     viewModelBuilder: () => HomeViewModel(),
   );
 }
}