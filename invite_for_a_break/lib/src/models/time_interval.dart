// ignore_for_file: non_constant_identifier_names

class TimeInterval {
  final String date;
  final String time_interval_start;
  final String time_interval_end;

  TimeInterval({
    required this.date,
    required this.time_interval_start,
    required this.time_interval_end,
  });

  factory TimeInterval.fromJson(Map<String, dynamic> json) {
    return TimeInterval(
      date: json['date'],
      time_interval_start: json['time_interval_start'],
      time_interval_end: json['time_interval_end'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time_interval_start': time_interval_start,
      'time_interval_end': time_interval_end,
    };
  }
}
