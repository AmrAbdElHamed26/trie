class Employee {
  final int id;
  final String name;
  final String jobTitle;
  final String workEmail;

  Employee({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.workEmail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Employee &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}