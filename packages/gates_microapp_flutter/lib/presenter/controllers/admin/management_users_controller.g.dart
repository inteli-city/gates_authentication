// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_users_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagementUsersController on ManagementUsersControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ManagementUsersControllerBase.state', context: context);

  @override
  ManagementUsersState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ManagementUsersState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getAllUsersAsyncAction = AsyncAction(
      'ManagementUsersControllerBase.getAllUsers',
      context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$ManagementUsersControllerBaseActionController =
      ActionController(name: 'ManagementUsersControllerBase', context: context);

  @override
  void setState(ManagementUsersState value) {
    final _$actionInfo = _$ManagementUsersControllerBaseActionController
        .startAction(name: 'ManagementUsersControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ManagementUsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
