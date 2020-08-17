// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserFormController on _UserFormControllerBase, Store {
  final _$loadingAtom = Atom(name: '_UserFormControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_UserFormControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_UserFormControllerBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$nameControllerAtom =
      Atom(name: '_UserFormControllerBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$activeAtom = Atom(name: '_UserFormControllerBase.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$emailVerifiedAtom =
      Atom(name: '_UserFormControllerBase.emailVerified');

  @override
  bool get emailVerified {
    _$emailVerifiedAtom.reportRead();
    return super.emailVerified;
  }

  @override
  set emailVerified(bool value) {
    _$emailVerifiedAtom.reportWrite(value, super.emailVerified, () {
      super.emailVerified = value;
    });
  }

  final _$_UserFormControllerBaseActionController =
      ActionController(name: '_UserFormControllerBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$_UserFormControllerBaseActionController.startAction(
        name: '_UserFormControllerBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_UserFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleActive() {
    final _$actionInfo = _$_UserFormControllerBaseActionController.startAction(
        name: '_UserFormControllerBase.toggleActive');
    try {
      return super.toggleActive();
    } finally {
      _$_UserFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
emailController: ${emailController},
passwordController: ${passwordController},
nameController: ${nameController},
active: ${active},
emailVerified: ${emailVerified}
    ''';
  }
}
