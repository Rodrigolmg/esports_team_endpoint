part of usecase;

class GetTeamDetailUseCase implements UseCase<TeamEntity,int?> {

    final TeamDetailRepository repository;

    const GetTeamDetailUseCase({
      required this.repository
    });

  @override
  Future<Either<Failure, TeamEntity>> call([int? teamId]) {
    return repository.getTeamDetails(teamId);
  }

}