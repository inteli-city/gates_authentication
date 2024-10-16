// ignore_for_file: constant_identifier_names

enum GroupEnum {
  GAIA,
  JUNDIAI,
  SABESP,
  FORMULARIOS;

  static GroupEnum stringToEnum(String group) {
    switch (group) {
      case 'GAIA':
        return GroupEnum.GAIA;
      case 'JUNDIAI':
        return GroupEnum.JUNDIAI;
      case 'FORMULARIOS':
        return GroupEnum.FORMULARIOS;
      case 'SABESP':
        return GroupEnum.SABESP;
      default:
        throw Exception('Group not found');
    }
  }

  static String typeName(GroupEnum group) {
    return group.name;
  }
}
