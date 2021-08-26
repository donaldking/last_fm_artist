import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Repository/Abstract/TSAArtistRepository.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Repository/TSArtistRepository.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/Abstract/TSAArtistUseCase.dart';

class TSGetArtistInfoUseCase implements TSAArtistUseCase {
  @override
  TSAArtistRepository artistRepository;

  static TSGetArtistInfoUseCase _instance = TSGetArtistInfoUseCase(
    artistRepository: TSArtistRepository.defaultRepository(),
  );

  TSGetArtistInfoUseCase({
    required this.artistRepository,
  });

  factory TSGetArtistInfoUseCase.defaultUseCase() {
    return _instance;
  }

  Future<TSAArtistModel?> getArtistInfo({required String mbid}) async {
    return await artistRepository.getArtistInfo(mbid: mbid);
  }
}
