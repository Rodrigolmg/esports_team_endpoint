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
  Future<TeamModel> getTeamDetails(int? teamId) async {
    Response response = await dio.getMethod(UrlPath.teamDetailPath(teamId));
    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      Map<String, dynamic> json = response.data['team'];

      TeamModel teamModel = TeamModel.fromJson(json);

      return Future.value(teamModel);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }


}