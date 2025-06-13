abstract class GenerateInstantVideoEvent {}

class GenerateInstantVideoScriptEvent extends GenerateInstantVideoEvent {
  final String userPromot;
  final String type;
  final String language;
  final String accentOrDialect;

  GenerateInstantVideoScriptEvent({
    required this.userPromot,
    required this.type,
    required this.language,
    required this.accentOrDialect,
  });
}

class GenerateInstantVideo extends GenerateInstantVideoEvent {
  final String title;
  final String generatedScript;
  final String language;
  final String accentOrDialect;
  final String type;

  GenerateInstantVideo({
    required this.title,
    required this.generatedScript,
    required this.language,
    required this.accentOrDialect,
    required this.type,
  });
}

class PollInstantVideoStatusEvent extends GenerateInstantVideoEvent {
  final String jobId;

  PollInstantVideoStatusEvent(this.jobId);
}
