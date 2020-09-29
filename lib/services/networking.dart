import 'package:http/http.dart' as http;
import 'dart:convert';

class nethelp{
  nethelp(this.url);
  final String url;


    Future getdata()async{
      http.Response responce= await http.get(url);

      if(responce.statusCode==200) {
        String data = responce.body;
        return jsonDecode(data);
      }
      else
      {
        print(responce.statusCode);
      }

  }

}
