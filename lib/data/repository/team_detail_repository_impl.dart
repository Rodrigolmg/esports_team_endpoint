part of repository;

class TeamDetailRepositoryImpl implements TeamDetailRepository {
  final TeamDetailDataSource remoteDataSource;
  final TeamDetailLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const TeamDetailRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, TeamEntity>> getTeamDetails(int? teamId) async {
    if(await networkInfo.isConnected){
      try {
        TeamModel playerDetail =
          await remoteDataSource.getTeamDetails(teamId);
        localDataSource.cacheTeamDetail(playerDetail);

        return Right(playerDetail);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        TeamModel? lastPlayerDetail =
          await localDataSource.getLastTeamDetail(teamId);

        if(lastPlayerDetail == null) {
          return Left(CacheFailure());
        }

        return Right(lastPlayerDetail);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}