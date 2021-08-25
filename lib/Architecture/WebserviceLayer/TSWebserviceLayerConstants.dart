final kJSONContentType = {
  'Content-Type': 'application/json',
};

// Endpoints / paths
const kDefaultFormat = "json";
const kAPIKey = "3b9cc0873d433e3fb4d82ee70e370a5d";
const kBaseURL = 'https://ws.audioscrobbler.com';
const kArtistSearchEndpoint = '/2.0/?method=artist.search&api_key=$kAPIKey&format=$kDefaultFormat';
const kArtistInfoEndpoint = '/2.0/?method=artist.getinfo&api_key=$kAPIKey&format=$kDefaultFormat';
