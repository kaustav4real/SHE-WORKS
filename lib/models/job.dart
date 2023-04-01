class Job {
  String company;
  String logoUrl;
  bool isMark;
  String title;
  String location;
  String time;
  List<String> req;
  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);

  static List<Job> generateJobs() {
    return [
      Job(
        'Google',
        'assets/images/google_logo.png',
        false,
        'Scholarship Program',
        'India',
        'Part Time',
        [
          'Must be 18 years or older.',
          'Must be comfortable with computer based, self-paced e-learning.',
          'Basic knowledge of English, both spoken and written, is important. Fluency in English is not a must, but will be an advantage.',
          'We will track your progress from week to week. The expectation is that you will demonstrate the necessary level of motivation to complete the course.',
        ],
      ),
      Job(
        'Airbnb',
        'assets/images/airbnb_logo.png',
        true,
        'Lead Experience Designer',
        'USA',
        'Full Time',
        [
          'Experience in the inclusive design or accessibility space, or with design language systems',
          'Proficiency designing across multiple platforms (iOS, Android, Desktop, Mobile Web)',
          'Effective communication skills and an ability to translate technical accessibility guidelines into persuasive practices people will embrace',
          'Demonstrated ability to deal with ambiguous environments, including adapting to new challenges, scenarios, and working styles',
        ],
      ),
      Job(
        'LinkedIn',
        'assets/images/linkedin_logo.png',
        false,
        'Intern, Sales Operations',
        'Sao Paulo',
        'Internship',
        [
          'Enrolled and pursuing a Bachelor’s degree in Engineering, Business Administration or similar courses with an analytical focus',
          'Proficiency in verbal and written English',
          'Experience using MS Excel and programming language',
          'Advanced MS Excel and SQL experience is a big plus',
        ],
      ),
      Job(
        'Adobe',
        'assets/images/adobe.png',
        false,
        'Software Development Engineer',
        'India',
        'Full Time',
        [
          'Participate in projects associated with the technology domain, including installation, upgrades, and deployment efforts',
          'Identify opportunity for service quality and availability within the technology domain environment',
          'Experience in Firebase',
          'Present recommendations for resolving issues or may escalate issues as needed to meet established service level agreements',
        ],
      ),
      Job(
        'Facebook',
        'assets/images/facebook.png',
        false,
        'Web Analyst',
        'India',
        'Full Time',
        [
          'Experience with web analytics tools such as Adobe Analytics (strongly preferred) or Google Analytics',
          'Good understanding of Microsoft Excel, SQL , Visualization and experience with Big Data tools like Hadoop and Hive.',
          'Knowledge of test design and combining disparate data sources is a plus.',
        ],
      ),
      Job(
        'Instagram',
        'assets/images/instagram.png',
        false,
        'Marketing Intern',
        'India',
        'Internship',
        [
          'Bachelor degree in marketing, communications, or a related field',
          'Proven experience in social media management',
          'Excellent writing skills with the ability to create engaging content that resonates with our audience',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'Google',
        'assets/images/google_logo.png',
        false,
        'Scholarship Program',
        'India',
        'Part Time',
        [
          'Must be 18 years or older.',
          'Must be comfortable with computer based, self-paced e-learning.',
          'Basic knowledge of English, both spoken and written, is important. Fluency in English is not a must, but will be an advantage.',
          'We will track your progress from week to week. The expectation is that you will demonstrate the necessary level of motivation to complete the course.',
        ],
      ),
      Job(
        'Airbnb',
        'assets/images/airbnb_logo.png',
        true,
        'Lead Experience Designer',
        'USA',
        'Full Time',
        [
          'Experience in the inclusive design or accessibility space, or with design language systems',
          'Proficiency designing across multiple platforms (iOS, Android, Desktop, Mobile Web)',
          'Effective communication skills and an ability to translate technical accessibility guidelines into persuasive practices people will embrace',
          'Demonstrated ability to deal with ambiguous environments, including adapting to new challenges, scenarios, and working styles',
        ],
      ),
      Job(
        'LinkedIn',
        'assets/images/linkedin_logo.png',
        false,
        'Intern, Sales Operations',
        'Sao Paulo',
        'Internship',
        [
          'Enrolled and pursuing a Bachelor’s degree in Engineering, Business Administration or similar courses with an analytical focus',
          'Proficiency in verbal and written English',
          'Experience using MS Excel and programming language',
          'Advanced MS Excel and SQL experience is a big plus',
        ],
      ),
      Job(
        'Adobe',
        'assets/images/adobe.png',
        false,
        'Software Development Engineer',
        'India',
        'Full Time',
        [
          'Participate in projects associated with the technology domain, including installation, upgrades, and deployment efforts',
          'Identify opportunity for service quality and availability within the technology domain environment',
          'Experience in Firebase',
          'Present recommendations for resolving issues or may escalate issues as needed to meet established service level agreements',
        ],
      ),
      Job(
        'Facebook',
        'assets/images/facebook.png',
        false,
        'Web Analyst',
        'India',
        'Full Time',
        [
          'Experience with web analytics tools such as Adobe Analytics (strongly preferred) or Google Analytics',
          'Good understanding of Microsoft Excel, SQL , Visualization and experience with Big Data tools like Hadoop and Hive.',
          'Knowledge of test design and combining disparate data sources is a plus.',
        ],
      ),
      Job(
        'Instagram',
        'assets/images/instagram.png',
        false,
        'Marketing Intern',
        'India',
        'Internship',
        [
          'Bachelor degree in marketing, communications, or a related field',
          'Proven experience in social media management',
          'Excellent writing skills with the ability to create engaging content that resonates with our audience',
          'Experience in Google Cloud Platform',
        ],
      ),
    ];
  }
}
