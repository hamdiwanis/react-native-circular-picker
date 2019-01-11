<h1 align="center">react-native-circular-picker</h1>
<p align="center">
<img src="https://user-images.githubusercontent.com/17047537/27594456-777bb7b8-5b62-11e7-8e45-2bbe695b3525.gif" width="270">  
<img src="https://user-images.githubusercontent.com/17047537/27594534-b350add4-5b62-11e7-987e-fc558eb8ee21.gif" width="270">
<img src="https://j.gifs.com/1jJy8m.gif" alt="Volume Picker Demo" width="269"> 
<img src="https://j.gifs.com/58NDNK.gif" alt="Time Picker Demo" width="269">
</p>

> Note: This project uses [CircularPicker](https://github.com/agilie/CircularPicker) and [AGCircularPicker](https://github.com/agilie/AGCircularPicker).

## Motivation

Use kotlin and swift to make a RN native ui module

## Demo
```javascript
class Demo extends Component {
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
      <View>
        <Text style={{color: this.state.color}}>
          {this.state.value}
        </Text>
        <CircularPicker text="Volume"
                        max={100}
                        colors={['#00EDE9', '#0087D9', '#8A1CC3']}
                        onValueChange={this.onValueChange}
                        onColorChange={this.onColorChange}/>
      </View>
    );
  }
}
```
  