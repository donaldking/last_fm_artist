abstract class TSABaseDataAccess {
  dynamic create(dynamic domain);

  dynamic read(dynamic id);

  dynamic readAll();

  dynamic update(dynamic domain);

  dynamic delete(dynamic id);

  dynamic deleteAll();
}
