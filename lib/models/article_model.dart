class Article {
  String? by;
  int? id;
  int? score;
  String? text;
  int? time;
  String? title;
  String? type;
  String? url;

  Article(
      {
        this.by,
        this.id,
        this.score,
        this.text,
        this.time,
        this.title,
        this.type,
        this.url,
      });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    by: json["by"],
    id: json["id"],
    score: json["score"],
    text: json["text"],
    time: json["time"],
    title: json["title"],
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "by": by,
    "id": id,
    "score": score,
    "text": text,
    "time": time,
    "title": title,
    "type": type,
    "url": url,
  };

}