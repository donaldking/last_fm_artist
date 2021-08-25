import 'package:flutter/material.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Generic/TSWebservice.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/TSArtistSearchResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/TSWebserviceLayerConstants.dart';

class TSArtistSearchScreen extends StatefulWidget {
  const TSArtistSearchScreen({Key? key}) : super(key: key);

  @override
  _TSArtistSearchScreenState createState() => _TSArtistSearchScreenState();
}

class _TSArtistSearchScreenState extends State<TSArtistSearchScreen> {
  /// TODO: Move to Bloc
  Future searchArtist() async {
    TSArtistSearchResource resource = TSArtistSearchResource(path: kArtistSearchEndpoint);
    Map<String, dynamic> params = {"artist": "Toni"};
    List<TSArtistDomain>? artistList = await TSWebservice().get(resource: resource, params: params);
    debugPrint("Artist List: ${artistList?.length}");
  }

  @override
  void initState() {
    /// TODO: Remove this
    searchArtist();
    super.initState();
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
