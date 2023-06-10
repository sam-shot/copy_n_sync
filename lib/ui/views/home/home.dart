import 'package:copy_n_sync/ui/shared/assets.dart';
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
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: ViewModelBuilder<HomeViewModel>.reactive(
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);
    
          viewModel.init();
        },
        onDispose: (model) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome Back \n${model.username}",
                            style: h3,
                          ),
                          Image.asset(AppAsset.logo)
                        ],
                      ),
                      const S.height(20),
                      AppTextField(
                        lines: 4,
                        controller: messageController,
                        hintText:
                            "Type Something to paste across your devices ...",
                      ),
                      const S.height(12),
                      CustomButton(
                        ontap: () {
                          model.send();
                        },
                        text: "Send",
                      ),
                      const S.height(15),
                      model.allTexts == []
                          ? Container()
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: kGrey,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: kPrimaryColor, width: 2)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Clipboard History",
                                            style: placeholder.copyWith(
                                                fontSize: 13,
                                                color: kSecondaryColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Container(
                                            color: kPrimaryColor,
                                            width: 120,
                                            height: 2,
                                          ),
                                          const S.height(2)
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3, vertical: 15),
                                        itemCount: model.allTexts.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              RecentText(
                                                text: model.allTexts[index]["text"]!,
                                                time: model.allTexts[index]["time"]!,
                                                onCopy: () => model.copyHistory(model.allTexts[index]["text"]!),
                                                onSend: () => model.sendHistory(model.allTexts[index]["text"]!),
                                              ),
                                              const S.height(10)
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                ),
        )),
        viewModelBuilder: () => HomeViewModel(),
      ),
    );
  }
}
