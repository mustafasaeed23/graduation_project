abstract class VideoEvent {}

class GenerateScriptEvent extends VideoEvent {
  final String url;
  final String language;
  final String accentOrDialect;

  GenerateScriptEvent({
    required this.url,
    required this.language,
    required this.accentOrDialect,
  });
}

class GenerateVideoEvent extends VideoEvent {
  final String title;
  final String generatedScript;
  final String language;
  final String accentOrDialect;

  GenerateVideoEvent({
    required this.title,
    required this.generatedScript,
    required this.language,
    required this.accentOrDialect,
  });
}

class PollVideoStatusEvent extends VideoEvent {
  final String jobId;

  PollVideoStatusEvent(this.jobId);
}
