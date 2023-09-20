import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:esports_team_endpoint/core/core.dart';
import 'package:esports_team_endpoint/data/datasource/datasource.dart';
import 'package:esports_team_endpoint/data/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<TeamImageLogoDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'team_image_logo_repository_impl_test.mocks.dart';

void main() {

  late TeamImageLogoRepositoryImpl repositoryImpl;
  late MockTeamImageLogoDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTeamImageLogoDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = TeamImageLogoRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tTeamId = 1;

  Uint8List bytes = ImageHandler.convertBase64('kjJSKhuYTTrhdKFG');

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getTeamLogo(tTeamId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getTeamLogo(any))
          .thenAnswer((_) async => bytes);

      final result = await repositoryImpl.getTeamLogo(tTeamId);

      verify(mockRemoteDataSource.getTeamLogo(tTeamId));
      expect(result, equals(Right(bytes)));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getTeamLogo(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getTeamLogo(tTeamId);

      verify(mockRemoteDataSource.getTeamLogo(tTeamId));
      expect(result, equals(const Left(ServerFailure())));
    });
  });
}