// ignore_for_file: prefer_const_constructors

import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked_services/stacked_services.dart';

class LoadingDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const LoadingDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                    border: Border.all(color: kSecondaryColor, width: 2)),
                child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: RiveAnimation.asset(AppAsset.loadingAnim)),
                ))));
  }
}
