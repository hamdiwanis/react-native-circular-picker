package com.reactnativecircularpicker.circularpicker

import android.graphics.Color
import android.view.View
import com.agilie.circularpicker.presenter.CircularPickerContract

import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

import com.facebook.react.uimanager.annotations.ReactProp

import com.agilie.circularpicker.ui.view.CircularPickerView
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.events.RCTEventEmitter
import com.facebook.react.bridge.Arguments
import com.facebook.react.common.MapBuilder

class CircularPickerManager : SimpleViewManager<View>() {

    override fun getName(): String {
        return REACT_CLASS
    }

    override fun getExportedCustomBubblingEventTypeConstants(): Map<String, Any> {
        return MapBuilder.builder<String, Any>()
                .put("valueChange", MapBuilder.of("phasedRegistrationNames", MapBuilder.of("bubbled", "onValueChange")))
                .put("colorChange", MapBuilder.of("phasedRegistrationNames", MapBuilder.of("bubbled", "onColorChange")))
                .build()
    }

    // todo: expose more params
    public override fun createViewInstance(context: ThemedReactContext): CircularPickerView {
        val circularPicker = CircularPickerView(context)
        circularPicker.apply {
            gradientAngle = 220
            maxLapCount = 1
            centeredTextSize = 60f
            valueChangedListener = (object : CircularPickerContract.Behavior.ValueChangedListener {
                override fun onValueChanged(value: Int) {
                    val event = Arguments.createMap()
                    event.putInt("value", value)

                    context.getJSModule(RCTEventEmitter::class.java)
                            .receiveEvent(circularPicker.id, "valueChange", event)

                }
            })
            colorChangedListener = (object : CircularPickerContract.Behavior.ColorChangedListener {
                override fun onColorChanged(r: Int, g: Int, b: Int) {
                    val color = String.format("#%02x%02x%02x", r, g, b)
                    val event = Arguments.createMap()
                    event.putString("value", color)

                    context.getJSModule(RCTEventEmitter::class.java)
                            .receiveEvent(circularPicker.id, "colorChange", event)
                }
            })
        }

        return circularPicker
    }

    @ReactProp(name = "colors")
    fun setColors(circularPicker: CircularPickerView, colorsArray: ReadableArray) {
        val parsedColors = IntArray(colorsArray.size(), { i ->
            Color.parseColor(colorsArray.getString(i))
        })
        circularPicker.apply {
            colors = parsedColors
        }
    }

    @ReactProp(name = "text")
    fun setText(circularPicker: CircularPickerView, text: String) {
        circularPicker.apply {
            centeredText = text
        }
    }

    @ReactProp(name = "current")
    fun setCurrent(circularPicker: CircularPickerView, value: Int) {
        circularPicker.apply {
            currentValue = value
        }
    }

    @ReactProp(name = "max")
    fun setMax(circularPicker: CircularPickerView, value: Int) {
        circularPicker.apply {
            maxValue = value
        }
    }

    companion object {
        val REACT_CLASS = "CircularPicker"
    }
}
