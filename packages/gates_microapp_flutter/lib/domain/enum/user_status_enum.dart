// ignore_for_file: constant_identifier_names

import 'package:gates_microapp_flutter/generated/l10n.dart';

enum UserStatusEnum {
  UNCONFIRMED,
  CONFIRMED,
  ARCHIVED,
  UNKNOWN,
  RESET_REQUIRED,
  FORCE_CHANGE_PASSWORD;

  String typeName() {
    return S.current.userStatusSchema(toString());
  }
}
