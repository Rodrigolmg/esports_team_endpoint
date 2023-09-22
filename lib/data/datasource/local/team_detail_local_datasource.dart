part of datasource;

abstract class TeamDetailLocalDataSource {
  Future<TeamModel?> getLastTeamDetail(int? teamId);
  Future<void> cacheTeamDetail(TeamModel team);
}

class TeamDetailLocalDataSourceImpl implements TeamDetailLocalDataSource {
  @override
  Future<void> cacheTeamDetail(TeamModel team) {
    // TODO: implement cacheTeamDetail
    throw UnimplementedError();
  }

  @override
  Future<TeamModel?> getLastTeamDetail(int? teamId) {
    // TODO: implement getLastTeamDetail
    throw UnimplementedError();
  }

}