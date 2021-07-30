// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersController on _UserControllerBase, Store {
  final _$pageLoadingAtom = Atom(name: '_UserControllerBase.pageLoading');

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

  final _$currentPageAtom = Atom(name: '_UserControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$usersAtom = Atom(name: '_UserControllerBase.users');

  @override
  ObservableFuture<List<UserModel>>? get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<List<UserModel>>? value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$fetchUsersAsyncAction = AsyncAction('_UserControllerBase.fetchUsers');

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageLoading: ${pageLoading},
currentPage: ${currentPage},
users: ${users}
    ''';
  }
}
