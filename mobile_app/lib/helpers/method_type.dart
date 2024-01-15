enum Methods {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  const Methods(this.method);
  final String method;
}
