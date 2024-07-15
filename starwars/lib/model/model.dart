class Film {
  final String title;
  final String director;

  Film({
    required this.title, 
    required this.director
    });
  
  factory Film.fromJson(Map<String, dynamic> json){
    return Film(
      title: json['title'], 
      director: json['director'],
      );
  }
}