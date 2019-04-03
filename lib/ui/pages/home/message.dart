class M {
  String u;
  String m;

  M({this.u, this.m});

  M.fromJson(var json)
      : this.u = json['u'],
        this.m = json['m'];

  toJson() => {
        "u": this.u,
        "m": this.m,
      };
}
