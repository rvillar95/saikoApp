class Vision {
  String descripcionVision;

  Vision(
      {this.descripcionVision});

  factory Vision.fromJson(Map<String, dynamic> json) {
    return Vision(
      descripcionVision: json['descripcionVision']
    );
  }
}
