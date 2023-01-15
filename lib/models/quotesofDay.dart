class QuotesOfDay {
  String? q;
  String? a;
  String? c;
  String? h;

  QuotesOfDay({this.q, this.a, this.c, this.h});

  QuotesOfDay.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    a = json['a'];
    c = json['c'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['a'] = this.a;
    data['c'] = this.c;
    data['h'] = this.h;
    return data;
  }
}
