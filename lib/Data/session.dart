class Session {
  int id = 0;
  String date = '';
  String description = '';
  String duration = '';

  Session(this.id, this.date, this.description, this.duration);

  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'];
    date = sessionMap['date'];
    description = sessionMap['description'];
    duration = sessionMap['duration'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration
    };
  }
}
