import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/Abstract/TSAArtistUseCase.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/TSGetArtistInfoUseCase.dart';
import 'package:last_artist/Architecture/ApplicationLayer/UseCases/TSSearchArtistUseCase.dart';
import 'package:last_artist/Architecture/PresentationLayer/Bloc/Abstract/TSABloc.dart';

class TSArtistBloc implements TSABloc {
  /// Stream Controller
  final StreamController<List<TSAArtistModel>> _artistStreamController = StreamController<List<TSAArtistModel>>();
  final StreamController<String> _searchTermStreamController = StreamController<String>();

  /// Stream
  Stream<List<TSAArtistModel>> get artistStream => _artistStreamController.stream;

  /// Sink
  Sink<String> get searchTermSink => _searchTermStreamController.sink;

  /// Stream subscriptions
  StreamSubscription? _searchTermStreamSubscription;

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
  }

  void _searchForArtist({required String searchTerm}) async {
    try {
      List<TSAArtistModel>? result = await (_searchUseCase as TSSearchArtistUseCase).searchArtist(artistName: searchTerm);
      debugPrint("Artist List: ${result?.first.name}");
    } catch (error) {
      debugPrint("Error searching");
    }
  }

  void _getArtistInfo({required String mbid}) async {
    try {
      (_getInfoUseCase as TSGetArtistInfoUseCase).getArtistInfo(mbid: mbid);
    } catch (error) {
      debugPrint("Error getting details");
    }
  }

  @override
  void dispose() {
    _artistStreamController.close();
    _searchTermStreamController.close();
    _searchTermStreamSubscription?.cancel();
  }
}
