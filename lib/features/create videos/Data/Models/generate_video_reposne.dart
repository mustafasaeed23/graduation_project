import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_entity.dart';

class GenerateVideoResponse extends GenerateVideoEntity {
  GenerateVideoResponse({required super.jobId});

  factory GenerateVideoResponse.fromJson(Map<String, dynamic> json) {
    return GenerateVideoResponse(jobId: json['jobId']);
  }
}
