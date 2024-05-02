import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/user_status_enum.dart';

class UserInfo {
  final String email;
  final String name;
  final String userId;
  final RoleEnum role;
  final List<GroupEnum> groups;
  final bool enabled;
  final UserStatusEnum status;

  UserInfo({
    required this.email,
    required this.name,
    required this.userId,
    required this.role,
    this.groups = const [],
    required this.enabled,
    required this.status,
  });
}
