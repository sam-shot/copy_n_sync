import 'package:copy_n_sync/ui/shared/dialog/setup_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class SetLoading {
  final _dialog = locator<DialogService>();
  final _n = locator<NavigationService>();

  SetLoading(bool status) {
    if (status == true) {
      _dialog.showCustomDialog(variant: DialogType.loading);
    } else {
      _n.back();
    }
  }
}
