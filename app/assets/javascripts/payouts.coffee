SW = undefined
$(document).ready ->
  base_url = $('#pay').attr('action')
  $('#recharge').on('click', ->
    SW = new BwGateway(
      sandbox: true
      user: 'pruebasbw'
      title: 'Mi Comercio'
      reference: 'testref01'
      concept: 'pago de prueba'
      currency: 'MXN'
      exchangeRate: ''
      total: $('#amount').val()
      items: [
        {
          name: 'Recarga'
          qty: 1
          desc: 'recarga de cuenta Nimanic'
          unitPrice: $('#amount').val()
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
      paymentOptions: 'visa,mastercard,amex'
      reviewOrder: true
      showShipping: true
      notifyUrl: base_url+'/payouts/save_data'
      successPage: base_url+'/payouts/payout_success'
      onSuccess: (data) ->
        alert '¡Gracias por tu pago!'
        return
      errorPage: base_url+'/payouts/payout_error'
      onError: (data) ->
        alert 'Error en el pago'
        return
      onCancel: (data) ->
        console.log 'Se cancelo el proceso'
        return
    )
    pagar()
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