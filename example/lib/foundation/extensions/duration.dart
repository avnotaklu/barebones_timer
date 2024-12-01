extension DurationExtension on Duration {
  String durationRepr() {
    var days = inDays;
    var hours = inHours % 24;
    var minutes = inMinutes % 60;
    var seconds = inSeconds % 60;
    var milliseconds = inMilliseconds % 1000;

    var days_s = days > 0 ? "${days}d" : "";
    var hours_s = hours > 0 ? "${hours}h" : "";
    var minutes_s = minutes > 0 ? "${minutes}m" : "";
    var seconds_s = seconds > 0 ? "${seconds}s" : "";
    var milliseconds_s =
        milliseconds > 0 ? "${(milliseconds / 10).floor()}ms" : "";

    final res = "$days_s $hours_s $minutes_s $seconds_s $milliseconds_s";
    return res.trim() == "" ? "lost" : res;
  }
}
