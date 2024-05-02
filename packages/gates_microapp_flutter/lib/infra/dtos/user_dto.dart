import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/user_status_enum.dart';

class UserDto extends UserInfo {
  UserDto({
    required super.email,
    required super.userId,
    required super.name,
    required super.role,
    required super.groups,
    required super.enabled,
    required super.status,
  });

  factory UserDto.fromMap(Map<String, dynamic> json) {
    return UserDto(
      email: json['email'],
      userId: json['user_id'],
      name: json['name'],
      role:
          RoleEnum.values.firstWhere((element) => element.name == json['role']),
      groups: (json['groups'] as List)
          .map((e) => GroupEnum.stringToEnum(e))
          .toList(),
      enabled: json['enabled'],
      status: UserStatusEnum.values
          .firstWhere((element) => element.name == json['user_status']),
    );
  }

  static List<UserDto> fromMaps(List array) {
    return array.map((e) => UserDto.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'user_id': userId,
      'name': name,
      'role': role.name,
      'groups': groups,
    };
  }
}
