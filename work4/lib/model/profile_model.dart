class ProfileModel{
  int id = 0 ;
  int studentID_li = 0 ;
  String firstName_li='';
  String lastName_li='';
  String nickName_li='';
  int birthDay_li = 0;
  String monthBirth_li='';
  int birthYear_li = 0;
  int Age_li = 0;
  int yearClass_li = 0;
  String branchName_li='';
  String universityName_li='';
  int numPhone_li = 0;

  ProfileModel(
      int id,
      int studentID_li,
      String firstName_li,
      String lastName_li,
      String nickName_li,
      int birthDay_li,
      String monthBirth_li,
      int birthYear_li,
      int Age_li,
      int yearClass_li,
      String branchName_li,
      String universityName_li,
      int numPhone_li
      ){

    this.id = id;
    this.studentID_li = studentID_li;
    this.firstName_li = firstName_li;
    this.lastName_li = lastName_li;
    this.nickName_li = nickName_li;
    this.birthDay_li = birthDay_li;
    this.monthBirth_li = monthBirth_li;
    this.birthYear_li = birthYear_li;
    this.Age_li = Age_li;
    this.yearClass_li = yearClass_li;
    this.branchName_li = branchName_li;
    this.universityName_li = universityName_li;
    this.numPhone_li = numPhone_li;
  }

  ProfileModel.empty(){
    this.id = 0;
    this.studentID_li = 0;
    this.firstName_li='';
    this.lastName_li='';
    this.nickName_li='';
    this.birthDay_li = 0;
    this.monthBirth_li='';
    this.birthYear_li = 0;
    this.Age_li = 0;
    this.yearClass_li = 0;
    this.branchName_li='';
    this.universityName_li='';
    this.numPhone_li = 0;

  }
}