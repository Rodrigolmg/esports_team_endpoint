part of datasource;

abstract class TeamDetailDataSource {
  Future<TeamModel> getTeamDetails(int? teamId);
}

class TeamDetailDataSourceImpl implements TeamDetailDataSource {

  final DioMethod dio;

  const TeamDetailDataSourceImpl({
    required this.dio,
  });

  @override
  Future<TeamModel> getTeamDetails(int? teamId) {
    // TODO: implement getTeamDetails
    throw UnimplementedError();
  }


}