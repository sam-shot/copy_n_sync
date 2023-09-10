import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/settings/settings_view_model.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      model.isAutomatic
                          ? Text(
                              "Syncing Options (Automatic)",
                              style: p,
                            )
                          : Text(
                              "Syncing Options (Manual)",
                              style: p,
                            ),
                      Transform.scale(
                        scale: 0.75,
                        child: CupertinoSwitch(
                          value: model.isAutomatic,
                          onChanged: (value) {
                            model.changeSyncOption(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: kPrimaryColor,
                  thickness: 1,
                ),
                InkWell(
                  onTap: () {
                    model.gotoDevices();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Devices Manager",
                          style: p,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: kPrimaryColor,
                  thickness: 1,
                )
              ],
            ),
            const S.height(20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomButton(
                ontap: () {
                  model.logout();
                },
                text: "Logout",
                isPrimary: false,
              ),
            )
          ],
        )),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
