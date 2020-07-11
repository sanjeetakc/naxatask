import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Resource<T> {
  final String url; 
  T Function(http.Response response) parse;

  Resource({this.url,this.parse});
}
class Webservice {

  Future<T> load<T>(Resource<T> resource) async {

      final response = await http.get(resource.url);
      if(response.statusCode == 200) {
        return resource.parse(response);
      } else {
        throw Exception('Failed to load data!');
      }
  }

}
static Resource<List<JobsListView>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => JobsListView.fromJson(model)).toList();
      }
    );

  }

class Constants {
}
class JobsListView {
  
  final String title; 
  final String descrption; 
  final String urlToImage; 

  JobsListView({this.title, this.descrption, this.urlToImage});

  factory JobsListView.fromJson(Map<String,dynamic> json) {
    return JobsListView(
      title: json['title'], 
      descrption: json['description'], 
      urlToImage: json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );
  }
}