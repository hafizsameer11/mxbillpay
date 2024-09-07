extension RemoveVerficationCode on String {

  /// this extension will remove the verification code comming in the api response
  String removeVerificationCode() {
    ///  regex to find the code in the message
    RegExp regex = RegExp(r'\(\d+\)');
    /// checking if the respnse contains reg expression
    if (this.contains(regex)) {
      String cleanedMessage = this.replaceAll(regex, "");
      return cleanedMessage;
    } else {
      return this;
    }
  }
}
