class DatesEntity {
  final DateTime maximum;
  final DateTime minimum;

  DatesEntity({
    required this.maximum,
    required this.minimum,
  });

  DatesEntity.empty()
      : maximum = DateTime.now(),
        minimum = DateTime.now();
}
