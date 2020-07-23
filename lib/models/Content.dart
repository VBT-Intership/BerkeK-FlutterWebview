class Content {
  String contentType;
  String contentUrl;

  Content({this.contentType, this.contentUrl});

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
      contentType: json['contentType'], 
      contentUrl: json['contentUrl']
  );
  
}
