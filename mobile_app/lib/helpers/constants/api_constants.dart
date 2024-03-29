abstract class ApiRoutes {
  static const login = "/auth/login";
  static const register = "/auth/register";
  static const profile = "/users";
  static const createFamily = "/families";
  static const joinFamily = "/families/request-to-join";
  static const acceptFamilyMember = "/families/accept-member";
  static const getRequests = "/families/get-requests";
  static const acceptMember = "/families/accept-member";
  static const control = "/devices";
  static const isParent = "/families/is-parent";
}
// family code to test 905040 