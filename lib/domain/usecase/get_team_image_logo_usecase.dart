part of usecase;

class GetTeamImageLogoUseCase implements UseCase<Uint8List,int?> {

    final TeamImageLogoRepository repository;

    const GetTeamImageLogoUseCase({
      required this.repository
    });

  @override
  Future<Either<Failure, Uint8List>> call([int? teamId]) {
    return repository.getTeamLogo(teamId);
  }

}