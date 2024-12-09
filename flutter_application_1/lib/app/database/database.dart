// database.dart

class Requirement {
  final String name;
  final String deadlineDate;
  final String deadlineTime;

  Requirement({
    required this.name,
    required this.deadlineDate,
    required this.deadlineTime,
  });
}

// Global list to store the requirements
List<Requirement> requirementsList = [];

// Function to add a new requirement to the list
void addRequirement(String name, String deadlineDate, String deadlineTime) {
  final newRequirement = Requirement(
    name: name,
    deadlineDate: deadlineDate,
    deadlineTime: deadlineTime,
  );

  requirementsList.add(newRequirement);
}
