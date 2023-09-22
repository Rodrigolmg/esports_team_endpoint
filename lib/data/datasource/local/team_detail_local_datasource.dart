part of datasource;

abstract class TeamDetailLocalDataSource {
  Future<TeamModel?> getLastTeamDetail(int? teamId);
  Future<void> cacheTeamDetail(TeamModel team);
}

class TeamDetailLocalDataSourceImpl implements TeamDetailLocalDataSource {
  @override
  Future<void> cacheTeamDetail(TeamModel team) async {
    Box teamDetailBox = Hive.box(DataSourceBoxName.teamDetailBoxName);

    if(!teamDetailBox.isOpen){
      teamDetailBox = await Hive.openBox(DataSourceBoxName.teamDetailBoxName);
    }

    teamDetailBox.add(team);
  }

  @override
  Future<TeamModel?> getLastTeamDetail(int? teamId) async {
    Box<TeamModel> teamDetailBox = Hive.box(DataSourceBoxName.teamDetailBoxName);

    if(!teamDetailBox.isOpen){
      teamDetailBox = await Hive.openBox(DataSourceBoxName.teamDetailBoxName);
    }

    TeamModel? lastTeamDetail
      = teamDetailBox.values.lastWhere((element) => element.id == teamId);
    return lastTeamDetail;
  }

}