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

// Wrap your root app to show default touch indicator for all touches
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

// Wrap your root app to show default touch indicator for all touches
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

| Name             | Description                                                                 | Type   | Required |                            Default Value                             |
| :--------------- | :-------------------------------------------------------------------------- | :----- | :------: | :------------------------------------------------------------------: |
| percent          | The percentage used for displaying the progress                             | Number |    ✓     |                                                                      |
| radius           | The radius in `px` of the component (including border)                      | Number |    ✓     |                                                                      |
| borderWidth      | The border width in `px`                                                    | Number |    ✓     |                                                                      |
| color            | The border color                                                            | String |          |     ![#f00](https://placehold.it/15/f00/000000?text=+) `'#f00'`      |
| shadowColor      | The background color of the border                                          | String |          |     ![#999](https://placehold.it/15/999/000000?text=+) `'#999'`      |
| bgColor          | The inner background color of the component                                 | String |          | ![#e9e9ef](https://placehold.it/15/e9e9ef/000000?text=+) `'#e9e9ef'` |
| children         | The children to render inside this component                                | Node   |          |                                `null`                                |
| containerStyle   | The custom styling which will be applied to the container of the `children` | Style  |          |                                `null`                                |
| outerCircleStyle | The custom styling which will be applied to the outer circle                | Style  |          |                                `null`                                |

## Author

[Michael Kiley](https://harbourviewtechnologies.com)

## License

MIT
