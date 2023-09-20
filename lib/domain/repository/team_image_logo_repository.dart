part of repository_contract;

abstract class TeamImageLogoRepository {
  Future<Either<Failure, Uint8List>> getTeamLogo(int? teamId);
}