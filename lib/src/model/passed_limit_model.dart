class PassedLimitModel {
  /// The [duration] parameter is required. If the difference between the current date and the given date is greater than this duration, the full date will be returned.
  final Duration duration;

  /// The [full] parameter is required. If 'true' it returns date and time. If 'false' it returns only date.
  final bool full;

  PassedLimitModel({
    required this.duration,
    required this.full,
  });

  @override
  String toString() => 'PassedLimitModel(duration: $duration, full: $full)';
}
