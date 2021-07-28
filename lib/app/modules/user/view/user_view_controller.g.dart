// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserViewController on _UserViewControllerBase, Store {
  final _$pageLoadingAtom = Atom(name: '_UserViewControllerBase.pageLoading');

  @override
  bool get pageLoading {
    _$pageLoadingAtom.reportRead();
    return super.pageLoading;
  }

  @override
  set pageLoading(bool value) {
    _$pageLoadingAtom.reportWrite(value, super.pageLoading, () {
      super.pageLoading = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_UserViewControllerBase.emailController');

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
      Atom(name: '_UserViewControllerBase.passwordController');

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
      Atom(name: '_UserViewControllerBase.nameController');

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

  final _$activeAtom = Atom(name: '_UserViewControllerBase.active');

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
      Atom(name: '_UserViewControllerBase.emailVerified');

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

  final _$_UserViewControllerBaseActionController =
      ActionController(name: '_UserViewControllerBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$_UserViewControllerBaseActionController.startAction(
        name: '_UserViewControllerBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_UserViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleActive() {
    final _$actionInfo = _$_UserViewControllerBaseActionController.startAction(
        name: '_UserViewControllerBase.toggleActive');
    try {
      return super.toggleActive();
    } finally {
      _$_UserViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageLoading: ${pageLoading},
emailController: ${emailController},
passwordController: ${passwordController},
nameController: ${nameController},
active: ${active},
emailVerified: ${emailVerified}
    ''';
  }
}
