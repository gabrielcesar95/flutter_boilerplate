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
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
