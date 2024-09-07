extension ReplaceHttp on String {
  String replaceHttp() {
    if (!this.contains("https") && this.contains("http")) {
      return this.replaceFirst("http", "https");
    } else {
      return this;
    }
  }
}