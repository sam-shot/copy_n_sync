// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';

final Map<String, TextEditingController> _EnterEmailTextEditingControllers = {};

final Map<String, FocusNode> _EnterEmailFocusNodes = {};

final Map<String, String? Function(String?)?> _EnterEmailTextValidations = {
  EmailValueKey: null,
};

mixin $EnterEmail on StatelessWidget {
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_EnterEmailTextEditingControllers.containsKey(key)) {
      return _EnterEmailTextEditingControllers[key]!;
    }
    _EnterEmailTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EnterEmailTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EnterEmailFocusNodes.containsKey(key)) {
      return _EnterEmailFocusNodes[key]!;
    }
    _EnterEmailFocusNodes[key] = FocusNode();
    return _EnterEmailFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
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
          EmailValueKey: emailController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        EmailValueKey: _getValidationMessage(EmailValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _EnterEmailTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_EnterEmailTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EnterEmailTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EnterEmailFocusNodes.values) {
      focusNode.dispose();
    }

    _EnterEmailTextEditingControllers.clear();
    _EnterEmailFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;

  set emailValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          EmailValueKey: value,
        }),
    );

    if (_EnterEmailTextEditingControllers.containsKey(EmailValueKey)) {
      _EnterEmailTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);

  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;

  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  void clearForm() {
    emailValue = '';
  }
}

extension Methods on FormViewModel {
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
}
