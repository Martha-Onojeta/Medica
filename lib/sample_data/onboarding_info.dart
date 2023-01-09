class OnboardingInfo{
  
  
  final image;
  final title;
  final description;

  OnboardingInfo(this.image, this.title, this.description);

}

 List<OnboardingInfo> onboardingPages = [
   OnboardingInfo('assets/images/img_1.png', 'Lend Items', 'Lend items and get paid by the borrower'),
    OnboardingInfo('assets/images/img_2.png', 'Borrow Items', 'Rent items and return at an affordable cost'),
     OnboardingInfo('assets/images/img_3.png', 'Track Your Items', 'Rent items and return at an affordable cost')
  ];