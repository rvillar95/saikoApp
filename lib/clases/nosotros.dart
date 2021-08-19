class NosotrosC {
  String descripcionNosotros;

  NosotrosC(
      {this.descripcionNosotros});

  factory NosotrosC.fromJson(Map<String, dynamic> json) {
    return NosotrosC(
      descripcionNosotros: json['descripcionNosotros']
    );
  }
}
