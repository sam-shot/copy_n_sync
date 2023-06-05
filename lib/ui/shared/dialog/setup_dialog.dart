import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/ui/shared/dialog/loading_dialog.dart';
import 'package:copy_n_sync/ui/shared/dialog/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {  
	final dialogService = locator<DialogService>();

	final builders = {
		DialogType.loading: (BuildContext context, DialogRequest request,
		Function(DialogResponse) completer) =>
		LoadingDialog(request: request, completer: completer),
		DialogType.success: (BuildContext context, DialogRequest request,
		Function(DialogResponse) completer) =>
		SuccessDialog(request: request, completer: completer),
    
  
		};  

	dialogService.registerCustomDialogBuilders(builders);
}


enum DialogType { loading, success }