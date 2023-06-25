// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PasswordValueKey = 'password';
const String CpasswordValueKey = 'cpassword';

final Map<String, TextEditingController> _CreatePasswordTextEditingControllers =
    {};

final Map<String, FocusNode> _CreatePasswordFocusNodes = {};

final Map<String, String? Function(String?)?> _CreatePasswordTextValidations = {
  PasswordValueKey: null,
  CpasswordValueKey: null,
};

mixin $CreatePassword on StatelessWidget {
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  TextEditingController get cpasswordController =>
      _getFormTextEditingController(CpasswordValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);
  FocusNode get cpasswordFocusNode => _getFormFocusNode(CpasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CreatePasswordTextEditingControllers.containsKey(key)) {
      return _CreatePasswordTextEditingControllers[key]!;
    }
    _CreatePasswordTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreatePasswordTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreatePasswordFocusNodes.containsKey(key)) {
      return _CreatePasswordFocusNodes[key]!;
    }
    _CreatePasswordFocusNodes[key] = FocusNode();
    return _CreatePasswordFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
    cpasswordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
    cpasswordController.addListener(() => _updateFormData(model));
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
          PasswordValueKey: passwordController.text,
          CpasswordValueKey: cpasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        PasswordValueKey: _getValidationMessage(PasswordValueKey),
        CpasswordValueKey: _getValidationMessage(CpasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CreatePasswordTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CreatePasswordTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreatePasswordTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreatePasswordFocusNodes.values) {
      focusNode.dispose();
    }

    _CreatePasswordTextEditingControllers.clear();
    _CreatePasswordFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;
  String? get cpasswordValue => this.formValueMap[CpasswordValueKey] as String?;

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PasswordValueKey: value,
        }),
    );

    if (_CreatePasswordTextEditingControllers.containsKey(PasswordValueKey)) {
      _CreatePasswordTextEditingControllers[PasswordValueKey]?.text =
          value ?? '';
    }
  }

  set cpasswordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CpasswordValueKey: value,
        }),
    );

    if (_CreatePasswordTextEditingControllers.containsKey(CpasswordValueKey)) {
      _CreatePasswordTextEditingControllers[CpasswordValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);
  bool get hasCpassword =>
      this.formValueMap.containsKey(CpasswordValueKey) &&
      (cpasswordValue?.isNotEmpty ?? false);

  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;
  bool get hasCpasswordValidationMessage =>
      this.fieldsValidationMessages[CpasswordValueKey]?.isNotEmpty ?? false;

  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
  String? get cpasswordValidationMessage =>
      this.fieldsValidationMessages[CpasswordValueKey];
  void clearForm() {
    passwordValue = '';
    cpasswordValue = '';
  }
}

extension Methods on FormViewModel {
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
  setCpasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CpasswordValueKey] = validationMessage;
}
