/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {StyleSheet, View, Text} from 'react-native';
import CircularPicker from './CircularPickerNativeView';


type Props = {};
export default class App extends Component<Props> {
  state = {
    value: 0,
    color: '#00EDE9'
  };

  onValueChange = ({nativeEvent}) => {
    this.setState({value: nativeEvent.value});
  }

  onColorChange = ({nativeEvent}) => {
    this.setState({color: nativeEvent.value});
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={{color: this.state.color, margin: 50, fontSize: 64}}>
          {this.state.value}
        </Text>
        <CircularPicker style={{height: 350, width: "100%"}}
                        onValueChange={this.onValueChange}
                        onColorChange={this.onColorChange}
                        max={100}
                        text="Volume"
                        colors={['#00EDE9', '#0087D9', '#8A1CC3']}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#1a1650',
  },
});
