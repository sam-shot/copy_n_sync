import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.dart';
import 'package:copy_n_sync/ui/views/home/home.dart';
import 'package:copy_n_sync/ui/views/navigation_bar/bottom_navigation_view_model.dart';
import 'package:copy_n_sync/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
      builder: (context, model, child) => Scaffold( 
        body: getScreenFromIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kPrimaryColor,
          currentIndex: model.currentIndex,
          iconSize: 25,
          selectedItemColor: kSecondaryColor,
          selectedIconTheme: IconThemeData(color: kSecondaryColor),
          selectedLabelStyle: placeholder,
          unselectedLabelStyle: placeholder,
          unselectedItemColor: kSecondaryColor,
          unselectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 48, 167, 117)),
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: "Settings"),
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavigationViewModel(),
    );
  }

  Widget getScreenFromIndex(index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return SettingsView();
      default:
        return HomeView();
    }
  }
}
