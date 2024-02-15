class ListUsers {
  final int idUsers;
  final String login;
  final String password;
  final String post;
  final int idBranch;
  final String branchName;

  ListUsers({
    required this.idUsers,
    required this.login,
    required this.password,
    required this.post,
    required this.idBranch,
    required this.branchName
});

  @override
  String toString() {
    return 'ListUsers{idUsers: $idUsers, login: $login, password: $password, post: $post, idBranch: $idBranch, branchName: $branchName}';
  }
}

