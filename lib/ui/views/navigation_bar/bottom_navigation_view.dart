import 'package:copy_n_sync/ui/views/navigation_bar/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationView extends StatelessWidget {
 const BottomNavigationView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<BottomNavigationViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => BottomNavigationViewModel(),
   );
 }
}