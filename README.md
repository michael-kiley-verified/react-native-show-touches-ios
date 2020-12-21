# react-native-show-touches-ios

Use react-native-show-touches to show customizable touch indicators for any touches recieved on iOS.  
App UI components will continue to function as expected.

Has no effect on Android.

## Getting started

`$ yarn add react-native-show-touches-ios`

or

`$ npm install react-native-show-touches-ios --save`

### Mostly automatic installation

`$ react-native link react-native-show-touches-ios`

## Usage

### Basic touch indicators

```javascript
import ShowTouches from "react-native-show-touches-ios";

// Wrap your root component to show default touch indicator for all touches
const App = () => {
  return (
    <ShowTouches>
      <SafeAreaView style={styles.container}>{/* Your app... */}</SafeAreaView>
    </ShowTouches>
  );
};
```

### Customization

```javascript
import ShowTouches from "react-native-show-touches-ios";

const App = () => {
  return (
    <ShowTouches
      color="red"
      opacity={0.1}
      radius={100}
      borderColor="orange"
      borderOpacity={0.9}
      borderWidth={5}
      fadeDuration={1}
    >
      <SafeAreaView style={styles.container}>{/* Your app... */}</SafeAreaView>
    </ShowTouches>
  );
};
```

## Props

| Name          | Description                                                         | Type   |                                       Default Value                                       |
| :------------ | :------------------------------------------------------------------ | :----- | :---------------------------------------------------------------------------------------: |
| color         | The inner color of the touch indicator                              | String | ![#007bff](https://placehold.it/15/007bff/000000?text=+) `'#007bff'` (UIColor.systemBlue) |
| opacity       | the inner opacity of the touch indicator                            | Number |                                            0.5                                            |
| radius        | The radius of the touch indicator                                   | Number |                                            40                                             |
| borderColor   | The border color                                                    | String | ![#007bff](https://placehold.it/15/007bff/000000?text=+) `'#007bff'` (UIColor.systemBlue) |
| borderOpacity | the opacity of the border                                           | Number |                                             1                                             |
| borderWidth   | The width of the border                                             | Number |                                             2                                             |
| fadeDuration  | the duration of the touch indicator's fade out animation in seconds | Number |                                            0.3                                            |

## Todo

- [x] iOS support
- [ ] Android support
- [ ] More animation customization options

## Author

[Michael Kiley](https://harbourviewtechnologies.com)

## License

MIT
