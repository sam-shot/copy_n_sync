import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/home/home.form.dart';
import 'package:copy_n_sync/ui/views/home/home_view_model.dart';
import 'package:copy_n_sync/ui/views/home/widgets/recent_text.dart';
import 'package:copy_n_sync/ui/widgets/app_text_field.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared/colors.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class HomeView extends StatelessWidget with $HomeView {
  HomeView({
    required this.id,
    super.key});
  String id;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);

        viewModel.init();
      },
      builder: (context, model, child) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: model.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    S.height(20),
                    AppTextField(
                      lines: 4,
                      controller: messageController,
                      hintText: "Enter a message to send",
                    ),
                    S.height(20),
                    CustomButton(
                      ontap: () {
                        model.send();
                      },
                      text: "Send",
                    ),
                    S.height(30),
                    CustomButton(
                      ontap: () {
                        model.logout();
                      },
                      text: "logout",
                    ),
                    S.height(30),
                    Text(
                      "Recently Synced texts",
                      style: h4B,
                    ),
                    model.allTexts == []
                        ? Container()
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 15),
                              itemCount: model.allTexts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    RecentText(model.allTexts[index]),
                                    S.height(10)
                                  ],
                                );
                              },
                            ),
                          )
                  ],
                ),
            ),
      )),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
