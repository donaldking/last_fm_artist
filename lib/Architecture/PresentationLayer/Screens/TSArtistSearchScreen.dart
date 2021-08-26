import 'package:flutter/material.dart';
import 'package:last_artist/Architecture/PresentationLayer/Bloc/TSArtistBloc.dart';

class TSArtistSearchScreen extends StatefulWidget {
  const TSArtistSearchScreen({Key? key}) : super(key: key);

  @override
  _TSArtistSearchScreenState createState() => _TSArtistSearchScreenState();
}

class _TSArtistSearchScreenState extends State<TSArtistSearchScreen> {
  TSArtistBloc _bloc = TSArtistBloc.defaultArtistBloc();

  Future searchArtist({required String searchTerm}) async {
    /// Call this when search button is pressed
    _bloc.searchTermSink.add(searchTerm);
  }

  @override
  void initState() {
    /// TODO: Remove this
    searchArtist(searchTerm: "Burna boy");
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Artist Search Screen',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: themeData.textTheme.headline3?.fontSize,
                  fontWeight: themeData.textTheme.headline1?.fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
