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
  Future<Uint8List?> getTeamLogo(int? teamId) {
    throw UnimplementedError();
  }
}