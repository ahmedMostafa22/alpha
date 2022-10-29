class Champion {
  final String name, imageUrl;

  Champion(this.name, this.imageUrl);

  factory Champion.fromJson(Map<String, dynamic> json) =>
      Champion(json['champion_name'], json['champion_splash']);
}
