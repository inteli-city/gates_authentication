// ignore_for_file: constant_identifier_names

enum GroupEnum {
  GAIA,
  JUNDIAI,
  RECAPE_SP,
  FORMULARIOS;

  static GroupEnum stringToEnum(String group) {
    switch (group) {
      case 'GAIA':
        return GroupEnum.GAIA;
      case 'JUNDIAI':
        return GroupEnum.JUNDIAI;
      case 'FORMULARIOS':
        return GroupEnum.FORMULARIOS;
      case 'RECAPE_SP':
        return GroupEnum.RECAPE_SP;
      default:
        throw Exception('Group not found');
    }
  }

  static String typeName(GroupEnum group) {
    return group.name;
  }
}
