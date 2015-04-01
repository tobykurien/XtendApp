package com.tobykurien.xtendapp

import android.widget.TextView
import android.widget.EditText
import android.widget.Button
import android.content.Context
import android.util.TypedValue
import android.graphics.Typeface
import android.os.Build

import org.xtendroid.annotations.CustomView

class Roboto {
   val public static String regularPath = "Roboto_v1.2/Roboto/Roboto-Regular.ttf"
}

@CustomView
class RobotoRegularTextView extends TextView {
   /**
    * Change the font sizes using the dimensions
    */
   def init(Context context) {
      setTextSize(TypedValue.COMPLEX_UNIT_SP, context.resources.getDimension(R.dimen.text_size_medium))
      if (Build.VERSION.SDK_INT < 21)
         typeface = Typeface.createFromAsset(context.assets, Roboto.regularPath)
   }
}

@CustomView
class RobotoRegularEditText extends EditText {
   /**
    * Change the font sizes using the dimensions
    */
   def init(Context context) {
      setTextSize(TypedValue.COMPLEX_UNIT_SP, context.resources.getDimension(R.dimen.text_size_medium))
      if (Build.VERSION.SDK_INT < 21)
         typeface = Typeface.createFromAsset(context.assets, Roboto.regularPath)
   }
}

@CustomView
class RobotoRegularButton extends Button {
   /**
    * Change the font sizes using the dimensions
    */
   def init(Context context) {
      setTextSize(TypedValue.COMPLEX_UNIT_SP, context.resources.getDimension(R.dimen.text_size_medium))
      if (Build.VERSION.SDK_INT < 21)
         typeface = Typeface.createFromAsset(context.assets, Roboto.regularPath)
   }
}