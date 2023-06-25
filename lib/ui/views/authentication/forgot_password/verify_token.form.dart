// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String VerifycodeValueKey = 'verifycode';

final Map<String, TextEditingController> _VerifyTokenTextEditingControllers =
    {};

final Map<String, FocusNode> _VerifyTokenFocusNodes = {};

final Map<String, String? Function(String?)?> _VerifyTokenTextValidations = {
  VerifycodeValueKey: null,
};

mixin $VerifyToken on StatelessWidget {
  TextEditingController get verifycodeController =>
      _getFormTextEditingController(VerifycodeValueKey);
  FocusNode get verifycodeFocusNode => _getFormFocusNode(VerifycodeValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_VerifyTokenTextEditingControllers.containsKey(key)) {
      return _VerifyTokenTextEditingControllers[key]!;
    }
    _VerifyTokenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _VerifyTokenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_VerifyTokenFocusNodes.containsKey(key)) {
      return _VerifyTokenFocusNodes[key]!;
    }
    _VerifyTokenFocusNodes[key] = FocusNode();
    return _VerifyTokenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    verifycodeController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    verifycodeController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          VerifycodeValueKey: verifycodeController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        VerifycodeValueKey: _getValidationMessage(VerifycodeValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _VerifyTokenTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_VerifyTokenTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _VerifyTokenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _VerifyTokenFocusNodes.values) {
      focusNode.dispose();
    }

    _VerifyTokenTextEditingControllers.clear();
    _VerifyTokenFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get verifycodeValue =>
      this.formValueMap[VerifycodeValueKey] as String?;

  set verifycodeValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          VerifycodeValueKey: value,
        }),
    );

    if (_VerifyTokenTextEditingControllers.containsKey(VerifycodeValueKey)) {
      _VerifyTokenTextEditingControllers[VerifycodeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasVerifycode =>
      this.formValueMap.containsKey(VerifycodeValueKey) &&
      (verifycodeValue?.isNotEmpty ?? false);

  bool get hasVerifycodeValidationMessage =>
      this.fieldsValidationMessages[VerifycodeValueKey]?.isNotEmpty ?? false;

  String? get verifycodeValidationMessage =>
      this.fieldsValidationMessages[VerifycodeValueKey];
  void clearForm() {
    verifycodeValue = '';
  }
}

extension Methods on FormViewModel {
  setVerifycodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[VerifycodeValueKey] = validationMessage;
}
