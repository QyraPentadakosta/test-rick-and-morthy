enum EnumMethod {
  get('get'),
  post('post'),
  put('put'),
  patch('patch'),
  delete('delete');

  final String value;

  const EnumMethod(this.value);
}
