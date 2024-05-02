// ignore_for_file: constant_identifier_names

import 'package:gates_microapp_flutter/generated/l10n.dart';

enum RoleEnum {
  ADMIN_COLLABORATOR,
  COLLABORATOR,
  ADMIN_USER,
  USER;

  static RoleEnum stringToEnum(String role) {
    switch (role) {
      case 'ADMIN_COLLABORATOR':
        return RoleEnum.ADMIN_COLLABORATOR;
      case 'COLLABORATOR':
        return RoleEnum.COLLABORATOR;
      case 'ADMIN_USER':
        return RoleEnum.ADMIN_USER;
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
