part of datasource;

abstract class TeamImageLogoDataSource {
  Future<Uint8List?> getTeamLogo(int? teamId);
}

class TeamImageLogoDataSourceImpl implements TeamImageLogoDataSource {

  final DioMethod dio;

  const TeamImageLogoDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Uint8List?> getTeamLogo(int? teamId) async {
    Response response = await dio.getMethod(UrlPath.teamLogoPath(teamId));
    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as String).isEmpty){
        throw ServerException(statusCode: 204);
      }

      Uint8List bytes = ImageHandler.convertBase64(response.data);
      return Future.value(bytes);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }
}