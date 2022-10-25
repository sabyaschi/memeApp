import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme{
  static fetchMoreMemes()async{
    Response response = await get(Uri.parse("https://meme-api.herokuapp.com/gimme"));

    Map getMeme = jsonDecode(response.body);
    return getMeme["url"];
    
  }
}