// ignore_for_file: prefer_const_constructors

import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SuccessDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SuccessDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {

  @override
  void initState() {
    delayDialog();
    super.initState();
  }

  delayDialog() async{
    await Future.delayed(Duration(seconds: 3));
    widget.completer(DialogResponse(confirmed: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                    border: Border.all(color: kSecondaryColor, width: 2)),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAsset.logo),
                          S.height(15),
                          Text("Account Created Successfully, please Login!", style: h3, textAlign: TextAlign.center,)
                        ],
                      ),
                    )))));
  }
}
