part of repository_contract;

abstract class TeamDetailRepository {
  Future<Either<Failure,TeamEntity>> getTeamDetails(int? teamId);
}