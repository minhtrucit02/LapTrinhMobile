enum DataStatus {
  inProgress,
  pending,
  completed,
}

extension DataStatusExtension on DataStatus {
  String get displayName {
    switch (this) {
      case DataStatus.inProgress:
        return 'In Progress';
      case DataStatus.pending:
        return 'Pending';
      case DataStatus.completed:
        return 'Completed';
    }
  }
}
