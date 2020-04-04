enum Env {
  PROD,
  DEV,
  LOCAL,
}

class EnvInfo {
  static Env env;

  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "http://biz-dev.miaogoche.cn";
      case Env.DEV:
        return "http://biz-dev.miaogoche.cn";
      case Env.LOCAL:
      default:
        return "http://10.0.2.2:8077";
//        return "http://biz-dev.miaogoche.cn";
    }
  }
}
