class Point {
  final int? id;
  final String name;
  final int number;
  final int total_point;
  final int daily_point;
  final int weekly_point;
  final int monthly_point;

  Point(
      {this.id,
      required this.name,
      required this.number,
      required this.total_point,
      required this.daily_point,
      required this.weekly_point,
      required this.monthly_point});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'total_point': total_point,
      'daily_point': daily_point,
      'weekly_point': weekly_point,
      'monthly_point': monthly_point,
    };
  }
  factory Point.fromMap(Map<String, dynamic> json) => Point(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        number: json['number'] ?? 0,
        total_point: json['total_point'] ?? 0,
        daily_point: json['daily_point'] ?? 0,
        weekly_point: json['weekly_point'] ?? 0,
        monthly_point: json['monthly_point'] ?? 0,
      );
}
