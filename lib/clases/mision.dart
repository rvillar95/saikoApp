class Mision {
  String descripcionMision;

  Mision(
      {this.descripcionMision});

  factory Mision.fromJson(Map<String, dynamic> json) {
    return Mision(
      descripcionMision: json['descripcionMision']
    );
  }
}
