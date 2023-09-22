import 'package:dartz/dartz.dart';
import 'package:esports_team_endpoint/core/core.dart';
import 'package:esports_team_endpoint/data/datasource/datasource.dart';
import 'package:esports_team_endpoint/data/model/model.dart';
import 'package:esports_team_endpoint/data/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<TeamDetailDataSource>(),
  MockSpec<TeamDetailLocalDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'team_detail_repository_impl_test.mocks.dart';

void main() {

  late TeamDetailRepositoryImpl repositoryImpl;
  late MockTeamDetailDataSource mockRemoteDataSource;
  late MockTeamDetailLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTeamDetailDataSource();
    mockLocalDataSource = MockTeamDetailLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = TeamDetailRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tTeamId = 1;

  TeamModel team = TeamModel(id: tTeamId);

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getTeamDetails(tTeamId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getTeamDetails(any))
          .thenAnswer((_) async => team);

      final result = await repositoryImpl.getTeamDetails(tTeamId);

      verify(mockRemoteDataSource.getTeamDetails(tTeamId));
      expect(result, equals(Right(team)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getTeamDetails(any))
          .thenAnswer((_) async => team);

      await repositoryImpl.getTeamDetails(tTeamId);

      verify(mockRemoteDataSource.getTeamDetails(tTeamId));
      verify(mockLocalDataSource.cacheTeamDetail(team));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getTeamDetails(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getTeamDetails(tTeamId);

      verify(mockRemoteDataSource.getTeamDetails(tTeamId));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('Device is offline', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => false);
    });

    test('Should return last locally cached data when the cached data is present',
            () async {
          when(mockLocalDataSource.getLastTeamDetail(tTeamId))
              .thenAnswer((_) async => team);

          final result = await repositoryImpl.getTeamDetails(tTeamId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastTeamDetail(tTeamId));
          expect(result, equals(Right(team)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastTeamDetail(tTeamId))
              .thenThrow(CacheException());

          final result = await repositoryImpl.getTeamDetails(tTeamId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastTeamDetail(tTeamId));
          expect(result, equals(Left(CacheFailure())));
        });
  });
}