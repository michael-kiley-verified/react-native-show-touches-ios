# react-native-show-touches-ios

<img src="https://github.com/michael-kiley-verified/react-native-show-touches-ios/blob/main/README/demo.gif" width="200" />

Use react-native-show-touches to show customizable touch indicators for any touches recieved on iOS.  
App UI components will continue to function as expected.

Has no effect on Android.

## Getting started

#### 1. Install with package manager

`$ yarn add react-native-show-touches-ios`

or

`$ npm install react-native-show-touches-ios --save`

#### 2. Install CocoaPod

`cd ios && pod install`

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

### \*\*\*Usage with react-navigation

When using with an app that uses react-navigation, you can wrap your root component with <ShowTouches\> just as you normally would.  
In order for your underlying UI components to work, you must use react-native-gesture-handler  
as described in the react-navigation docs.

#### Proper usage with react-native-gesture-handler:

```javascript

import ShowTouches from 'react-native-show-touches-ios';
import {TouchableOpacity} from 'react-native-gesture-handler

const App = () => {
  return (
    <ShowTouches
      color="red"
      opacity={0.1}
      radius={100}
      borderColor="orange"
      borderOpacity={0.9}
      borderWidth={5}
      fadeDuration={1}>
        ... REACT-NAVIGATION-CONTAINER ...
            <TouchableOpacity
              onPress={() => {
                console.log('pressed');
              }}>
              <Text>Press Me</Text>
            </TouchableOpacity>
        ... REACT-NAVIGATION-CONTAINER END ...
    </ShowTouches>
  );
};
```

#### Incorrect usage with react-native-gesture-handler:

TouchableOpacity from react-native will not work when using react-navigation - must use the component  
provided by react-native-gesture handler when using react-navigation

```javascript
import ShowTouches from "react-native-show-touches-ios";
import { TouchableOpacity } from "react-native";

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
      ... REACT-NAVIGATION-CONTAINER ...
      <TouchableOpacity
        onPress={() => {
          console.log("pressed");
        }}
      >
        <Text>Press Me</Text>
      </TouchableOpacity>
      ... REACT-NAVIGATION-CONTAINER END ...
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
