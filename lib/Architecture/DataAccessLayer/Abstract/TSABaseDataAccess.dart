abstract class TSABaseDataAccess {
  dynamic create(dynamic entity);
  dynamic read(dynamic entity);
  dynamic readAll();
  dynamic update(dynamic entity);
  dynamic delete(dynamic entity);
  dynamic deleteAll();
}
