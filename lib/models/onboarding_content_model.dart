class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  // UnbordingContent(
  //     image: 'assets/images/Group 295.png',
  //     title: "Employee Termination ",
  //     discription: "Lorem ipsum dolor sit amet, consectetur \nadipisicing  elit, sed do"
  // ),
  UnbordingContent(
      image: 'assets/images/img_onboarding_1.png',
      title: "Welcome to The Sabre 22 Agent Portal",
      discription: "Based out of Southern California, "
          "our Security Consultants develop security strategies, "
          "solutions and recommendations, not just for the "
          "short term, but are ever mindful of our "
          "client’s long-term goals and concerns."),
  UnbordingContent(
      image: 'assets/images/img_onboarding_2.png',
      title: "Welcome Aboard",
      discription: "In order to use this application we need "
          "to gather some information from you."
          "\n\nPlease Log in or create an account to get started. "
          "\n\nYou must complete all on boarding documents "
          "to use this application."),
];
