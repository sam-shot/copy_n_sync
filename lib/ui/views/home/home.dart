import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/home/home.form.dart';
import 'package:copy_n_sync/ui/views/home/home_view_model.dart';
import 'package:copy_n_sync/ui/views/home/widgets/recent_text.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
      onWillPop: () async {
        return false;
      },
      child: ViewModelBuilder<HomeViewModel>.reactive(
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);

          viewModel.init();
        },
        onDispose: (model) {},
        builder: (context, model, child) => Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(193, 2, 79, 9),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: const Color.fromARGB(244, 0, 0, 0),
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return model.isUploading
                                  ? Text(
                                      model.fileName,
                                      style: h3.copyWith(
                                        fontSize: 13.5.sp,
                                      ),
                                    )
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          model.fileName,
                                          style: h3.copyWith(
                                            fontSize: 13.5.sp,
                                          ),
                                        ),
                                        Gap(10.h),
                                        CustomButton(
                                          text: "Select File",
                                          ontap: () {
                                            model.selectFile(setState);
                                          },
                                        ),
                                        Gap(10.h),
                                        CustomButton(
                                          text: "Upload File",
                                          ontap: () {
                                            model.uploadFile(setState);
                                          },
                                        ),
                                      ],
                                    );
                            })),
                      );
                    },
                  );
                },
                label: Row(
                  children: [
                    const Icon(Icons.file_upload_outlined),
                    const Gap(2),
                    Text(
                      "Upload a File",
                      style: p,
                    ),
                  ],
                )),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hey there \n${model.username}",
                          style: h3,
                        ),
                        IconButton(
                            onPressed: () {
                              model.goToSettings();
                            },
                            icon: const Icon(
                              Icons.settings_outlined,
                              color: Colors.white70,
                            ))
                      ],
                    ),
                  ),
                  Gap(10.h),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white.withOpacity(0.01)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.25),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Clipboard History",
                                    style: placeholder.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Gap(2.h)
                                ],
                              ),
                            ),
                          ),
                          model.allTexts.isEmpty
                              ? Expanded(
                                  child: RefreshIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.2),
                                    color: kPrimaryColor,
                                    onRefresh: () async {
                                      await model.getAllTexts();
                                      return;
                                    },
                                    child: ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Gap(MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.37),
                                            Center(
                                                child: SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                color: kPrimaryColor,
                                              ),
                                            )),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: RefreshIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.2),
                                    color: kPrimaryColor,
                                    onRefresh: () async {
                                      await model.getAllTexts();
                                      return;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3, vertical: 15),
                                        itemCount: model.allTexts.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              RecentText(
                                                text: model.allTexts[index]
                                                    ["text"]!,
                                                time: model.allTexts[index]
                                                    ["time"]!,
                                                onCopy: () => model.copyHistory(
                                                    model.allTexts[index]
                                                        ["text"]!),
                                                onSend: () => model.sendHistory(
                                                    model.allTexts[index]
                                                        ["text"]!),
                                              ),
                                              Gap(15.h)
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
        viewModelBuilder: () => HomeViewModel(),
      ),
    );
  }
}
