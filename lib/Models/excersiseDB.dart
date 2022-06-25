class ExerciseModel {
  String? id;
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? name;
  String? target;

  ExerciseModel({
    this.id,
    this.name,
    this.gifUrl,
    this.target,
    this.bodyPart,
    this.equipment,
  });

  ExerciseModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gifUrl = json['gifUrl'];
    target = json['target'];
    bodyPart = json['bodyPart'];
    equipment = json['equipment'];
  }
}

