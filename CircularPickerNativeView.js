import React, { Component } from 'react'
import { requireNativeComponent } from 'react-native'

const CircularPicker = requireNativeComponent('CircularPicker', CircularPickerView);

export default class CircularPickerView extends Component {
  render () {
    return <CircularPicker {...this.props} />
  }
}
