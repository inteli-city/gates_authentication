import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/user_status_enum.dart';

class UserInfoAdapter {
  static List<UserInfo> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
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

  static Map<String, dynamic> toJson(UserInfo user) {
    return {
      'email': user.email,
      'user_id': user.userId,
      'name': user.name,
      'role': user.role.name,
      'groups': user.groups,
    };
  }
}
