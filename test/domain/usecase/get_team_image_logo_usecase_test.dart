import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:esports_team_endpoint/core/core.dart';
import 'package:esports_team_endpoint/domain/repository/repository_contract.dart';
import 'package:esports_team_endpoint/domain/usecase/usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<TeamImageLogoRepository>()])
import 'get_team_image_logo_usecase_test.mocks.dart';

void main(){

  late GetTeamImageLogoUseCase useCase;
  late MockTeamImageLogoRepository mockRepository;

  setUp((){
    mockRepository = MockTeamImageLogoRepository();
    useCase = GetTeamImageLogoUseCase(repository: mockRepository);
  });

  const int tTeamId = 1;

  Uint8List bytes = ImageHandler.convertBase64('kjJSKhuYTTrhdKFG');

  test('Should get Right value', () async {

    when(mockRepository.getTeamLogo(any))
        .thenAnswer((_) async => Right(bytes));

    final result = await useCase(tTeamId);

    expect(result, Right(bytes));
    verify(mockRepository.getTeamLogo(tTeamId));
    verifyNoMoreInteractions(mockRepository);
  });
}