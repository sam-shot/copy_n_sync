import 'package:copy_n_sync/ui/views/devices_view/devices_view_model.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../shared/text_styles.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DevicesViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text("Device Manager", style: h3),
                Gap(20.h),
                model.data == null
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        model.showReload ?  CustomButton(
                        ontap: () {
                          model.init();
                        },
                        text: "Tap to reload",
                      ) : Container()
                      ],
                    )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: model.data!.data!.devices!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                model.data!.data!.devices![index].deviceName!,
                                style: p,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    model.removeDevice(model
                                        .data!.data!.devices![index].deviceId!);
                                  },
                                  icon: const Icon(Icons.close, color: Colors.white70)),
                            );
                          },
                        ),
                      ),
                model.pref.getData("fromlogin")
                    ? CustomButton(
                        ontap: () {
                          model.proceed();
                        },
                        text: "Continue",
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => DevicesViewModel(),
    );
  }
}
