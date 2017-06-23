@RecordForm = React.createClass
  # Sets the initial state of the form
  getInitialState: ->
    title: ''
    date: ''
    amount: ''

  # Determines if the user input is valid
  # In this case just checking for presence
  valid: ->
    @state.title && @state.date && @state.amount

  # Handles changes to the form
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  # Handles the submission of the form
  handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { record: @state }, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , 'JSON'

  # Renders the form
  render: ->
    # The form
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit

      # Form group for date
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange

        # Form group for title
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Title'
            name: 'title'
            value: @state.title
            onChange: @handleChange

        # Form group for amount
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Amount'
            name: 'amount'
            value: @state.amount
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create record'
