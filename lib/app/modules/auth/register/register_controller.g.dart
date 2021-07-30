// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$pageLoadingAtom = Atom(name: '_RegisterControllerBase.pageLoading');

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

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageLoading: ${pageLoading}
    ''';
  }
}
