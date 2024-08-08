class Pattern {
  final int id;
  final String patternName;
  final String pdfPath;

  Pattern(this.id, this.patternName, this.pdfPath);

  Pattern.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        patternName = json['pattern_name'] as String,
        pdfPath = json['pdf_path'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'pattern_name': patternName,
        'pdf_path': pdfPath,
      };

  // factory Pattern.fromJson(Map<String, dynamic> json) {
  //   return Pattern(
  //     json['id'],
  //     json['pattern_name'],
  //   );
  // }
}
