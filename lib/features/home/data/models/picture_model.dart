// import 'dart:convert';

// class Picture {
//   final String? fileName;
//   final String? contentType;
//   final String? filePath;
//   final String? thumbnailPath;
//   final int? fileSize;
//   final bool? isMain;
//   Picture({
//     this.fileName,
//     this.contentType,
//     this.filePath,
//     this.thumbnailPath,
//     this.fileSize,
//     this.isMain,
//   });

//   Picture copyWith({
//     String? fileName,
//     String? contentType,
//     String? filePath,
//     String? thumbnailPath,
//     int? fileSize,
//     bool? isMain,
//   }) {
//     return Picture(
//       fileName: fileName ?? this.fileName,
//       contentType: contentType ?? this.contentType,
//       filePath: filePath ?? this.filePath,
//       thumbnailPath: thumbnailPath ?? this.thumbnailPath,
//       fileSize: fileSize ?? this.fileSize,
//       isMain: isMain ?? this.isMain,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'fileName': fileName,
//       'contentType': contentType,
//       'filePath': filePath,
//       'thumbnailPath': thumbnailPath,
//       'fileSize': fileSize,
//       'isMain': isMain,
//     };
//   }

//   factory Picture.fromMap(Map<String, dynamic> map) {
//     return Picture(
//       fileName: map['fileName'] != null ? map['fileName'] as String : null,
//       contentType:
//           map['contentType'] != null ? map['contentType'] as String : null,
//       filePath: map['filePath'] != null ? map['filePath'] as String : null,
//       thumbnailPath:
//           map['thumbnailPath'] != null ? map['thumbnailPath'] as String : null,
//       fileSize: map['fileSize'] != null ? map['fileSize'] as int : null,
//       isMain: map['isMain'] != null ? map['isMain'] as bool : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Picture.fromJson(String source) =>
//       Picture.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Picture(fileName: $fileName, contentType: $contentType, filePath: $filePath, thumbnailPath: $thumbnailPath, fileSize: $fileSize, isMain: $isMain)';
//   }

//   @override
//   bool operator ==(covariant Picture other) {
//     if (identical(this, other)) return true;

//     return other.fileName == fileName &&
//         other.contentType == contentType &&
//         other.filePath == filePath &&
//         other.thumbnailPath == thumbnailPath &&
//         other.fileSize == fileSize &&
//         other.isMain == isMain;
//   }

//   @override
//   int get hashCode {
//     return fileName.hashCode ^
//         contentType.hashCode ^
//         filePath.hashCode ^
//         thumbnailPath.hashCode ^
//         fileSize.hashCode ^
//         isMain.hashCode;
//   }
// }

