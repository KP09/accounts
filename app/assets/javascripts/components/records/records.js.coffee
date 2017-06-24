@Records = React.createClass
  # Sets the initial state
  getInitialState: ->
    records: @props.data

  # Sets the default props
  getDefaultProps: ->
    records: []

  # Handles the addition of a new record
  addRecord: (record) ->
    records = @state.records.slice()
    records.push record
    @setState records: records

  deleteRecord: (record) ->
    records = @state.records.slice()
    index = records.indexOf record
    records.splice index, 1
    @replaceState records: records

  # Renders the records table
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'records'
        React.DOM.h2
          className: 'title'
          'Records'
        React.createElement RecordForm, handleNewRecord: @addRecord
        React.DOM.hr null
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for record in @state.records
              React.createElement Record, record: record, key: record.id, handleDeleteRecord: @deleteRecord
