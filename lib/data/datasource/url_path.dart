part of datasource;

class UrlPath {
  static String teamLogoPath(int? teamId) => 'team/$teamId/image';
  static String teamDetailPath(int? teamId) => 'team/$teamId';
}