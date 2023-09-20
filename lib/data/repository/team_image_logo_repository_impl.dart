part of repository;

class TeamImageLogoRepositoryImpl implements TeamImageLogoRepository {

  final TeamImageLogoDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const TeamImageLogoRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, Uint8List>> getTeamLogo(int? teamId) async {
    if(await networkInfo.isConnected){
      try {
        Uint8List? bytes = await remoteDataSource.getTeamLogo(teamId);

        if(bytes == null || bytes.isEmpty){
          return const Left(ServerFailure());
        }

        return Right(bytes);

      } on ServerException catch (sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      return const Left(ServerFailure(statusCode: 204));
    }
  }
}