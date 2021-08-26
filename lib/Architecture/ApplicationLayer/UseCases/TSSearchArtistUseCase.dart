import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Repository/Abstract/TSAArtistRepository.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Repository/TSArtistRepository.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/Abstract/TSAArtistUseCase.dart';

class TSSearchArtistUseCase implements TSAArtistUseCase {
  @override
  TSAArtistRepository artistRepository;

  static TSSearchArtistUseCase _instance = TSSearchArtistUseCase(
    artistRepository: TSArtistRepository.defaultRepository(),
  );

  TSSearchArtistUseCase({
    required this.artistRepository,
  });

  factory TSSearchArtistUseCase.defaultUseCase() {
    return _instance;
  }

  Future<List<TSAArtistModel>?> searchArtist({required String artistName}) async {
    return await artistRepository.searchArtist(artistName: artistName);
  }
}
