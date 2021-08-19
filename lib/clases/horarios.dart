class Horarios {
  String nombreHorario;
  String desdeHorario;
  String hastaHorario;
  Horarios({this.nombreHorario, this.desdeHorario, this.hastaHorario});

  factory Horarios.fromJson(Map<String, dynamic> json) {
    return Horarios(
        nombreHorario: json['nombreHorario'],
        desdeHorario: json['desdeHorario'],
        hastaHorario: json['hastaHorario']);
  }
}
