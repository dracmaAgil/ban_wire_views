$(document).ready ->
  $('#pay').on('submit', pagar)

SW = new BwGateway(
  sandbox: true
  user: 'pruebasbw'
  title: 'Mi Comercio'
  reference: 'testref01'
  concept: 'pago de prueba'
  currency: 'MXN'
  exchangeRate: ''
  total: '100.00'
  months: [
    3
    6
    9
    12
  ]
  items: [
    {
      name: 'Articulo uno'
      qty: 1
      desc: 'Articulo de prueba numero uno'
      unitPrice: 10
    }
    {
      name: 'Articulo dos'
      qty: 2
      desc: 'Articulo numero dos de prueba'
      unitPrice: 40
    }
    {
      name: 'Otro articulo con nombre mas largo'
      qty: 2
      desc: 'Articulo numero tres de prueba con una descripcion larga'
      unitPrice: 40
    }
  ]
  cust:
    fname: 'Ricardo'
    mname: 'Gamba'
    lname: 'Lavin'
    email: 'prueba@banwire.com'
    phone: '55555555'
    addr: 'Direccion 440'
    city: 'Mexico'
    state: 'DF'
    country: 'MEX'
    zip: '14145'
  ship:
    addr: 'Direccion 440'
    city: 'Mexico'
    state: 'DF'
    country: 'MEX'
    zip: '14145'
  paymentOptions: 'all'
  reviewOrder: true
  showShipping: true
  recurring:
    interval: 'month'
    limit: 10
    start: '2014-01-01'
    total: '50.00'
  notifyUrl: 'https://www.mipagina.com/recibir.php'
  successPage: 'http://google.com'
  onSuccess: (data) ->
    alert '¡Gracias por tu pago!'
    return
  pendingPage: 'http://yahoo.com'
  onPending: (data) ->
    alert 'El pago está pendiente por ser efectuado'
    return
  challengePage: 'http://challenge.com'
  onChallenge: (data) ->
    alert 'Pago enviado a validaciones de seguridad'
    return
  errorPage: 'http://facebook.com'
  onError: (data) ->
    alert 'Error en el pago'
    return
  onCancel: (data) ->
    console.log 'Se cancelo el proceso'
    return
)

pagar = ->
  # Podemos pagar con los valores por defecto
  SW.pay()

  ### O podemos modificar los valores antes de efectuar el pago
  SW.pay({
      total: 500,
      concept: "Concepto nuevo"
  });
  ###