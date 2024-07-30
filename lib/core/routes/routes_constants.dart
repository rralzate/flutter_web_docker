abstract class RoutesConstants {
  //Auth
  static const String rootRoute = '/';
  static const String loginRoute = '/auth/login';
  static const String registerRoute = '/auth/register';

  //DashBoard
  static const String dashBoardRoute = '/dashboard';

  //Devices
  static const String devicesRoute = '/dashboard/devices';
  static const String deviceRoute = '/dashboard/device/:id';

  //categories
  static const String categoriesRoute = '/dashboard/categories';
  //subCategories
  static const String subCategoriesRoute = '/dashboard/subCategories';
  //subResume
  static const String resumeRoute = '/dashboard/resume';
  static const String resumeMoreInformationRoute = '/dashboard/resumeMore/:id';
}
