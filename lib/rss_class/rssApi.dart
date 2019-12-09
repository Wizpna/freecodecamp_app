class RSSApi {
  String status;
  Feed feed;
  List<Items> items;

  RSSApi({this.status, this.feed, this.items});

  RSSApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feed {
  String url;
  String title;
  String link;
  String author;
  String description;
  String image;

  Feed(
      {this.url,
      this.title,
      this.link,
      this.author,
      this.description,
      this.image});

  Feed.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    link = json['link'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['link'] = this.link;
    data['author'] = this.author;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

class Items {
  String title;
  String pubDate;
  String link;
  String guid;
  String author;
  String thumbnail;
  String description;
  String content;
  Enclosure enclosure;
  List<Null> categories;

  Items(
      {this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      this.content,
      this.enclosure,
      this.categories});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    link = json['link'];
    guid = json['guid'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    content = json['content'];
    enclosure = json['enclosure'] != null
        ? new Enclosure.fromJson(json['enclosure'])
        : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['pubDate'] = this.pubDate;
    data['link'] = this.link;
    data['guid'] = this.guid;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['content'] = this.content;
    if (this.enclosure != null) {
      data['enclosure'] = this.enclosure.toJson();
    }
    
    return data;
  }
}

class Enclosure {
  String link;

  Enclosure({this.link});

  Enclosure.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    return data;
  }
}