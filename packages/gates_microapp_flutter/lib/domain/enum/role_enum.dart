// ignore_for_file: constant_identifier_names

import 'package:gates_microapp_flutter/generated/l10n.dart';

enum RoleEnum {
  COLLABORATOR,
  ADMIN,
  USER;

  static RoleEnum stringToEnum(String role) {
    switch (role) {
      case 'COLLABORATOR':
        return RoleEnum.COLLABORATOR;
      case 'ADMIN':
        return RoleEnum.ADMIN;
      case 'USER':
        return RoleEnum.USER;
      default:
        throw Exception('Role not found');
    }
  }

  static String typeName(RoleEnum role) {
    return S.current.roleSchema(role.name);
  }
}

extension RoleEnumExtension on RoleEnum {
  String get typeName {
    return S.current.roleSchema(toString());
  }
}
