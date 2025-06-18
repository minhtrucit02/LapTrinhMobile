class Attachment {
  Attachment({required this.id, required this.fileName, required this.fileUrl});
  final int id;
  final String fileName;
  final String fileUrl;

  factory Attachment.fromJson(Map<String, dynamic> data) {
    return Attachment(
      id: data['id'],
      fileName: data['fileName'] ?? '',
      fileUrl: data['fileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'fileName': fileName, 'fileUrl': fileUrl};
}
