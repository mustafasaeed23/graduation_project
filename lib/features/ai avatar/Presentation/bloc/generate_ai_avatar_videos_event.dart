abstract class GenerateAiAvatarVideosEvent {}

class GenerateScriptEventAiAvatar extends GenerateAiAvatarVideosEvent {
  final String userPromot;
  final String language;
  final String accentOrDialect;
  final String type;

  GenerateScriptEventAiAvatar({
    required this.userPromot,
    required this.language,
    required this.accentOrDialect,
    required this.type,
  });
}

class GenerateVideoEvent extends GenerateAiAvatarVideosEvent {
  final String title;
  final String generatedScript;
  final String language;
  final String accentOrDialect;
  final String speaker;
  final String type;

  GenerateVideoEvent({
    required this.title,
    required this.generatedScript,
    required this.language,
    required this.accentOrDialect,
    required this.speaker,
    required this.type,
  });
}

class CheckVideoStatusEvent extends GenerateAiAvatarVideosEvent {
  final String jobId;

  CheckVideoStatusEvent(this.jobId);
}
