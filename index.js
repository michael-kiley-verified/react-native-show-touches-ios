import PropTypes from "prop-types";
import React from "react";
import { requireNativeComponent, Platform, View } from "react-native";

var RNShowTouchesView = requireNativeComponent("ShowTouchesView");

const ShowTouches = (props) => {
  return Platform.OS === "ios" ? (
    <RNShowTouchesView style={{ height: "100%", width: "100%" }} {...props}>
      {props.children}
    </RNShowTouchesView>
  ) : (
    <View style={{ height: "100%", width: "100%" }} {...props}>
      {props.children}
    </View>
  );
};

ShowTouches.propTypes = {
  /**
   * The color of the circle shown to indicate a touch; defaults to UIColor.systemBlue
   */
  color: PropTypes.string,
  /**
   * The opacity of the circle shown to indicate a touch; defaults to 0.5
   */
  opacity: PropTypes.number,
  /**
   * The radius of the circle shown to indicate a touch; defaults to 40
   */
  radius: PropTypes.number,
  /**
   * The color of the border around the touch indicator circle; defaults to UIColor.systemBlue
   */
  borderColor: PropTypes.string,
  /**
   * The width of the border around the touch indicator circle; defaults to 2
   */
  borderWidth: PropTypes.number,
  /**
   * The opacity of the border around the touch indicator circle; defaults to 1
   */
  borderOpacity: PropTypes.number,
  /**
   * The duration of the fade out animation for the touch indicator circle
   */
  fadeDuration: PropTypes.number,
};

module.exports = ShowTouches;
