import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';

class LoggedUserInfo {
  final String email;
  final String name;
  final String userId;
  final RoleEnum role;
  final List<GroupEnum> groups;
  final String accessToken;
  final String refreshToken;
  final String idToken;

  LoggedUserInfo({
    required this.email,
    required this.name,
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required this.role,
    this.groups = const [],
  });
}
