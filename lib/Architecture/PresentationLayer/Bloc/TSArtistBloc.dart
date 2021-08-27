import 'dart:async';

import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/Abstract/TSAArtistUseCase.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/TSGetArtistInfoUseCase.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/TSSearchArtistUseCase.dart';
import 'package:last_artist/Architecture/PresentationLayer/Bloc/Abstract/TSABloc.dart';

class TSArtistBloc implements TSABloc {
  /// Stream Controller
  final StreamController<List<TSAArtistModel>> _artistStreamController = StreamController<List<TSAArtistModel>>();
  final StreamController<String> _searchTermStreamController = StreamController<String>();
  final StreamController<TSAArtistModel> _getArtistInfoStreamController = StreamController<TSAArtistModel>();

  /// Stream
  Stream<List<TSAArtistModel>> get artistStream => _artistStreamController.stream;

  /// Sink
  Sink<String> get searchTermSink => _searchTermStreamController.sink;

  Sink<TSAArtistModel> get getArtistInfoSink => _getArtistInfoStreamController.sink;

  /// Stream subscriptions
  StreamSubscription? _searchTermStreamSubscription, _getArtistInfoStreamSubscription;

  /// Use Cases
  TSAArtistUseCase _searchUseCase;
  TSAArtistUseCase _getInfoUseCase;

  static TSArtistBloc _instance = TSArtistBloc(
    searchUseCase: TSSearchArtistUseCase.defaultUseCase(),
    getInfoUseCase: TSGetArtistInfoUseCase.defaultUseCase(),
  );

  /// Init
  TSArtistBloc({
    required TSAArtistUseCase searchUseCase,
    required TSAArtistUseCase getInfoUseCase,
  })  : _searchUseCase = searchUseCase,
        _getInfoUseCase = getInfoUseCase {
    _setupSubscriptions();
  }

  factory TSArtistBloc.defaultArtistBloc() {
    return _instance;
  }

  void _setupSubscriptions() {
    _searchTermStreamSubscription = _searchTermStreamController.stream.listen((String searchTerm) {
      if (searchTerm.isNotEmpty && searchTerm.length >= 2) {
        _searchForArtist(searchTerm: searchTerm);
      }
    });
    _getArtistInfoStreamSubscription = _getArtistInfoStreamController.stream.listen((TSAArtistModel artist) {
      _getArtistInfo(artist: artist);
    });
  }

  void _searchForArtist({required String searchTerm}) async {
    try {
      List<TSAArtistModel>? result = await (_searchUseCase as TSSearchArtistUseCase).searchArtist(artistName: searchTerm);
      if (result != null) {
        _artistStreamController.add(result);
      }
    } catch (error) {
      _artistStreamController.addError(error.toString());
    }
  }

  void _getArtistInfo({required TSAArtistModel artist}) async {
    try {
      (_getInfoUseCase as TSGetArtistInfoUseCase).getArtistInfo(artist: artist);
    } catch (error) {
      _artistStreamController.addError(error.toString());
    }
  }

  @override
  void dispose() {
    _artistStreamController.close();
    _searchTermStreamController.close();
    _searchTermStreamSubscription?.cancel();
    _getArtistInfoStreamController.close();
    _getArtistInfoStreamSubscription?.cancel();
  }
}
