import 'package:dartz/dartz.dart';
import 'package:esports_team_endpoint/domain/entity/entity.dart';
import 'package:esports_team_endpoint/domain/repository/repository_contract.dart';
import 'package:esports_team_endpoint/domain/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<TeamDetailRepository>()])
import 'get_team_detail_usecase_test.mocks.dart';

void main() {
  late GetTeamDetailUseCase useCase;
  late MockTeamDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockTeamDetailRepository();
    useCase = GetTeamDetailUseCase(repository: mockRepository);
  });

  const int tTeamId = 1;

  TeamEntity team = TeamEntity(id: tTeamId);

  test('Should get Right value', () async {

    when(mockRepository.getTeamDetails(any))
        .thenAnswer((_) async => Right(team));

    final result = await useCase(tTeamId);

    expect(result, Right(team));
    verify(mockRepository.getTeamDetails(tTeamId));
    verifyNoMoreInteractions(mockRepository);
  });
}