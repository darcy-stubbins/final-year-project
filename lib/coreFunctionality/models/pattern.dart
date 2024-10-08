class Pattern {
  final int id;
  final String patternName;
  final String pdfPath;
  final String patternAuthor;

  //constructor
  Pattern(this.id, this.patternName, this.pdfPath, this.patternAuthor);

  //mapping the parsed in json elements (id, name and path) to a map
  Pattern.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        patternName = json['pattern_name'] as String,
        pdfPath = json['pdf_path'] as String,
        patternAuthor = json['user_name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'pattern_name': patternName,
        'pdf_path': pdfPath,
        'user_name': patternAuthor,
      };
}
