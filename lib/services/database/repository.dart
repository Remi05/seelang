abstract class Repository<T> {
  Future<T> once(String id);
  Future<List<T>> all();
  Future<void> add(T value);
  Future<void> update(String id, T value);
  Future<void> delete(String id);
}