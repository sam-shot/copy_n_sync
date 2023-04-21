// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String MessageValueKey = 'message';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  MessageValueKey: null,
};

mixin $HomeView on StatelessWidget {
  TextEditingController get messageController =>
      _getFormTextEditingController(MessageValueKey);
  FocusNode get messageFocusNode => _getFormFocusNode(MessageValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }
    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    messageController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    messageController.addListener(() => _updateFormData(model));
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
          MessageValueKey: messageController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        MessageValueKey: _getValidationMessage(MessageValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _HomeViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_HomeViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get messageValue => this.formValueMap[MessageValueKey] as String?;

  set messageValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          MessageValueKey: value,
        }),
    );

    if (_HomeViewTextEditingControllers.containsKey(MessageValueKey)) {
      _HomeViewTextEditingControllers[MessageValueKey]?.text = value ?? '';
    }
  }

  bool get hasMessage =>
      this.formValueMap.containsKey(MessageValueKey) &&
      (messageValue?.isNotEmpty ?? false);

  bool get hasMessageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey]?.isNotEmpty ?? false;

  String? get messageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey];
  void clearForm() {
    messageValue = '';
  }
}

extension Methods on FormViewModel {
  setMessageValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MessageValueKey] = validationMessage;
}
